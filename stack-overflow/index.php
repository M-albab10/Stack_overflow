<!-- This is home page should get 10 recent questions and 10 questions with most answers as cards -->
<?php
session_start();
require_once 'functions/web.php';
require_once 'functions/db_connection.php';
require_once 'functions/question.php';
$active = 'home';

if (isset($_GET['question_id'])) {
    $_SESSION['question_id'] = $_GET['question_id'];
    redirect('question.php');
}
if(isset($_GET['tab'])){
    $tab = $_GET['tab'];
    if ($tab == 'latest') 
        $questions = getLast10Questions();
        else
        $questions = getTop10AnsweredQuestions();
}
else{
    $tab = '';
    $questions = getLast10Questions();
}

// $answerd_questions = getTop10AnsweredQuestions();
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
       <hr>
       <?php
                    if (isset($_GET['tab'])){
                        if ($tab == 'rated') 
                        echo('<h1>Top Questions:</h1>');
                        else
                        echo('<h1>Recent Questions:</h1>');
                    }
                    else
                    echo('<h1>Recent Questions:</h1>');
        ?>
        <hr>
        <?php 
         if ($tab !== 'rated') 
            echo (' <a href="?tab=latest" class="btn btn-primary">Latest</a>
            <a href="?tab=rated" class="btn btn-primary">Rating</a>');
            else
            echo (' <a href="?tab=latest" class="btn btn-primary">Latest</a>
            <a href="?tab=rated" class="btn btn-primary">Rating</a>');
        ?>
        <hr>
        <?php
        foreach ($questions as $question) {
            echo '
                <div class="card mb-4">
                    <div class="card-body">
                        <a class="card-link" href="index.php?question_id=' . $question['id'] . '">' . $question['title'] . '</a>
                        <div class="card-subtitle text-muted">
                            <h6 class="mt-1">answers: ' . $question['answers_count'] . '</h6>
                            <h6 class="mt-4">Question By: <span class="text-success">' . $question['username'] . '</span></h6>
                <p class="text-muted">' . $question["created_at"] . '</p>
                        </div>
                    </div>
                </div>';
        }
        ?>
    </div>
</body>

</html>