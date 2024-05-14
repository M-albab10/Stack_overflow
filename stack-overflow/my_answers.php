<!-- Display current user answers with pagination and can edit, delete, add, search -->
<?php
require_once 'functions/db_connection.php';
require_once 'functions/web.php';
require_once 'functions/answer.php';

if (!isLoggedIn()) {
    redirect('index.php');
}

if (isset($_POST['delete'])) {
    deleteAnswer($_POST['answer_id']);
}

$active = 'my_answers';

$answers = getCurrentUserAnswers();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Stack Overflow</title>
    <?php require_once 'components/styles.php' ?>
</head>

<body>
    <?php require_once 'components/navbar.php' ?>
    <hr><hr><hr><hr><hr>
    <div class="container mt-4">
        <h1 class="mt-2">My Answers:</h1>
        <?php
        foreach ($answers as $answer) {
            echo '
            <form method="post" action="#">
                <div class="card mb-4">
                    <div class="card-body">
                    <a class="card-link" href="index.php?question_id=' . $answer['question_id'] . '">Go To Question</a>
                        <div class="card-text">
                        ' . htmlspecialchars_decode($answer['answer']) . '
                        </div>
                        <a href="edit_answer.php?answer_id=' . $answer['id'] . '" class="btn btn-primary">Edit</a>
                        <input type="hidden" name="answer_id" value="' . $answer['id'] . '"/>
                        <button name="delete" type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </form>';
        }
        ?>
    </div>
</body>

</html>