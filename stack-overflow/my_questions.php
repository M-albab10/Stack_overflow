<!-- Display current user questions with pagination and can edit, delete, add, search -->
<?php
require_once 'functions/db_connection.php';
require_once 'functions/web.php';
require_once 'functions/question.php';

if (!isLoggedIn()) {
    redirect('index.php');
}

if (isset($_POST['delete'])) {
    deleteQuestion($_POST['question_id']);
}

$active = 'my_questions';

$questions = getCurrentUserQuestions($_GET['page'] ?? 1);
$pagination_count = getCurrentUserPaginationCount();
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
        <a href="create_question.php" class="btn btn-primary">Create Question</a>
        <h1 class="mt-2">My Questions:</h1>
        <?php
        foreach ($questions as $question) {
            echo '
            <form method="post" action="#">
                <div class="card mb-4">
                    <div class="card-body">
                        <a class="card-link" href="index.php?question_id=' . $question['id'] . '">' . $question['title'] . '</a>
                        <div class="card-subtitle text-muted">
                            <h6 class="mt-1">answers: ' . $question['answers_count'] . '</h6>
                        </div>
                        <a href="edit_question.php?question_id=' . $question['id'] . '" class="btn btn-primary">Edit</a>
                        <input type="hidden" name="question_id" value="' . $question['id'] . '"/>
                        <button name="delete" type="submit" class="btn btn-danger">Delete</button>
                    </div>
                </div>
            </form>';
        }
        if (isset($_GET['page']) && $_GET['page'] === 1)
            echo '<nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="my_questions.php?page=1">Previous</a></li>';
        else{
            echo '<nav aria-label="Page navigation example">
        <ul class="pagination">
            <li class="page-item"><a class="page-link" href="my_questions.php?page=';?><?php 
            if(isset($_GET['page'])) {
            if($_GET['page'] == 1){
                echo '1';
            }else
            echo
            (($_GET['page'] ?? 2) - 1); 
        }else
        echo'1';
        echo '">Previous</a></li>';
        }
        for ($i = 1; $i <= $pagination_count; $i++) {
            if ($i === ($_GET['page'] ?? 1))
                echo '
                <li class="page-item"><a class="page-link active" href="my_questions.php?page=' . $i . '">' . $i  . '</a></li>
                ';
            else
                echo '
                <li class="page-item"><a class="page-link" href="my_questions.php?page=' . $i . '">' . $i. '</a></li>
                ';
        }
        if (!isset($_GET['page']))
            echo '
                <li class="page-item"><a class="page-link" href="my_questions.php">Next</a></li>
            </ul>
            </nav>';
        else
            echo '
                <li class="page-item"><a class="page-link" href="my_questions.php?page=' . (($_GET['page'] ?? 1) + 1) . '">Next</a></li>
            </ul>
            </nav>';
        ?>
    </div>
</body>

</html>