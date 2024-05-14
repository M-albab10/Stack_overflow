<!-- Display question with answers and can add answer,  rate an answer -->
<?php
session_start();
require_once 'functions/web.php';
require_once 'functions/db_connection.php';
require_once 'functions/question.php';
require_once 'functions/answer.php';

$active = null;

if (!isset($_SESSION['question_id'])) {
    redirect('index.php');
}
$question_id = $_SESSION['question_id'];
if (isLoggedIn())
    $current_user_id = currentUserId();

if (isset($_POST['answer'])) {
    if (!isLoggedIn()) {
        redirect('signin.php');
    }
    createAnswer($_POST['answer_answer'], $question_id, $current_user_id);
} else if (isset($_POST['rate'])) {
    if (!isLoggedIn()) {
        redirect('signin.php');
    }
    rateAnswer($_POST['answer_id'], $_POST['rate'], $current_user_id);
} else if (isset($_POST['add_comment'])) {
    if (!isLoggedIn()) {
        redirect('signin.php');
    }
    createComment($_POST['question_id'] ?? null, $_POST['answer_id'] ?? null, $current_user_id, $_POST['comment']);
}

$question = getQuestion($question_id);
$answers = getQuestionAnswers($question_id);
$question_comments = getQuestionComments($question_id);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stack Overflow</title>
    <?php require_once 'components/styles.php' ?>

    <style>
        .rate {
            float: left;
            height: 46px;
            padding: 0 10px;
        }

        .rate:not(:checked)>input {
            position: absolute;
            top: -9999px;
        }

        .rate:not(:checked)>label {
            float: right;
            width: 1em;
            overflow: hidden;
            white-space: nowrap;
            cursor: pointer;
            font-size: 30px;
            color: #ccc;
        }

        .rate:not(:checked)>label:before {
            content: '★ ';
        }

        .rate>input:checked~label {
            color: #ffc700;
        }

        .rate:not(:checked)>label:hover,
        .rate:not(:checked)>label:hover~label {
            color: #deb217;
        }

        .rate>input:checked+label:hover,
        .rate>input:checked+label:hover~label,
        .rate>input:checked~label:hover,
        .rate>input:checked~label:hover~label,
        .rate>label:hover~input:checked~label {
            color: #c59b08;
        }
    </style>
</head>

<body>
    <?php require_once 'components/navbar.php' ?>
    <hr><hr><hr><hr><hr>
    <div class="container mt-4">
        <div class="card mb-2">
            <div class="card-body">
                <h5 class="card-title"><?php echo $question['title'] ?></h5>
                <p class="card-text"><?php echo htmlspecialchars_decode($question['description']) ?></p>
                <h6 class="mt-4">Question By: <span class="text-success"><?php echo $question['username'] ?></span></h6>
                <p class="text-muted"><?php echo $question['created_at'] ?></p>
            </div>
        </div>
        <?php echo count($question_comments) > 0 ? 'Comments:' : 'No Comments' ?>
        <?php
        foreach ($question_comments as $comment) {
            echo '
            <div class="card my-2">
                <div class="card-body ">
                    <p class="card-text">' .  $comment['content']  . '</p>
                    <p class="card-subtitle">Commented By: <span class="text-success"> ' .  $comment['name']  . ' </span></p>
                    <p class="text-muted">Created at: ' .  $comment['created_at']  . '</p>
                </div>
            </div>';
        }
        ?>
        <form action="question.php" method="post" class="form">
            <div class="form-group">
                <input name="comment" placeholder="Add Comment" type="text" class="form-control">
            </div>
            <input type="hidden" name="question_id" value="<?php echo $question['id'] ?>" required>
            <button name="add_comment" type="submit" class="btn btn-primary">Add comment</button>
        </form>
        <div class="mt-4">
            <?php
            if (count($answers) === 0) {
                echo '<h4 class="text-muted mt-4">No answers yet be the first one</h4>';
            } else {
                echo '<h4 class="mt-4"> ' . count($answers) . ' Answers</h4>';
                foreach ($answers as $answer) {
                    $answer_comments = getAnswerComments($answer['id']);
                    $rateElement = '';
                    if (!checkIfUserDidAlreadyRatedAnswer($answer['id'], $current_user_id)) {
                        $rateElement = '
                        <form id="theForm" method="post" action="question.php">
                                        <input type="hidden" name="answer_id" value="' . $answer['id'] . '"/>
                                        <div class="rate">
                                            <input type="radio" id="star5" name="rate" value="5" onChange="autoSubmit();"/>
                                            <label for="star5" title="text">5 stars</label>
                                            <input type="radio" id="star4" name="rate" value="4" onChange="autoSubmit();"/>
                                            <label for="star4" title="text">4 stars</label>
                                            <input type="radio" id="star3" name="rate" value="3" onChange="autoSubmit();"/>
                                            <label for="star3" title="text">3 stars</label>
                                            <input type="radio" id="star2" name="rate" value="2" onChange="autoSubmit();"/>
                                            <label for="star2" title="text">2 stars</label>
                                            <input type="radio" id="star1" name="rate" value="1" onChange="autoSubmit();"/>
                                            <label for="star1" title="text">1 star</label>
                                        </div>
                                    </form>';
                    }
                    echo '
                    <div class="card mb-2">
                        <div class="card-body">
                        <p class="card-text">' .  htmlspecialchars_decode($answer['answer'])  . '</p>
                        Rate:
                        <label for="rating-5" class="fa fa-star"> ' . ($answer['rate'] ? round($answer['rate'], 1) : 0) . '</label>
                            <h6 class="mt-4">Answered By: <span class="text-success">' . $answer['username'] . '</span></h6>
                            <p class="text-muted"> Created at: ' .  $answer['created_at']  . '</p>
                            <div class="star-rating" id="star-rating">
                                <div class="star-input">
                                    ' . $rateElement . ' 
                                </div>
                            </div>
                        </div>
                    </div>';
                    echo count($answer_comments) > 0 ? 'Comments' : 'No Comments';
                    foreach ($answer_comments as $comment) {
                        echo '
                        <div class="my-2">
                            <div class="card-body">
                                <p class="card-text">' .  $comment['content']  . '</p>
                                <p class="card-subtitle">Commented By: <span class="text-success"> ' .  $comment['username']  . ' </span></p>
                                <p class="text-muted"> Created at: ' .  $comment['created_at']  . '</p>
                            </div>
                        </div>';
                    }
                    echo '
                    <form action="question.php" method="post" class="mt-2">
                        <div class="form-group">
                            <input name="comment" placeholder="Add Comment" type="text" class="form-control">
                        </div>
                        <input type="hidden" name="answer_id" value="' . $answer['id'] . '" required>
                        <button name="add_comment" type="submit" class="btn btn-primary">Add comment</button>
                    </form>';
                }
            }
            ?>
        </div>
        <h2 class="mt-4">Your Answer</h2>
        <form action="question.php" method="post">
            <div class="row justify-content-md-center">
                <div class="col-lg-12 mt-4">
                    <div class="form-group">
                        <textarea name="answer_answer" id="editor"></textarea>
                    </div>
                    <button name="answer" type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </form>
    </div>


    <script src="https://cdn.tiny.cloud/1/pg1x28xat94v0az13fouoe7y2oo0lfr93byt94whvwtfg393/tinymce/6/tinymce.min.js" referrerpolicy="origin"></script>

    <script>
        function autoSubmit() {
            var formObject = document.forms['theForm'];
            formObject.submit();
        }
        tinymce.init({
            selector: 'textarea',
            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount',
            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table | align lineheight | numlist bullist indent outdent | emoticons charmap | removeformat',
            menubar: false,
        });
    </script>
</body>

</html>