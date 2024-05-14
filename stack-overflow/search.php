<!-- Search all questions -->
<?php
require_once 'functions/db_connection.php';
require_once 'functions/question.php';
require_once 'functions/web.php';

$active = null;

if (!isset($_GET['search'])) {
    redirect('index.php');
}

$questions = searchQuestions($_GET['search']);
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
        <h1>Result:</h1>
        <?php
        foreach ($questions as $question) {
            echo '
                <div class="card mb-4">
                    <div class="card-body">
                        <a class="card-link" href="index.php?question_id=' . $question['id'] . '">' . $question['title'] . '</a>
                        <div class="card-subtitle text-muted">
                            <h6 class="mt-1">answers: ' . $question['answers_count'] . '</h6>
                        </div>
                    </div>
                </div>';
        }
        ?>
    </div>
</body>

</html>