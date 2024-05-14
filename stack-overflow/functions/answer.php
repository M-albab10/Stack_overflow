<?php

function createAnswer($answer, $question_id, $user_id)
{
    $db = connectDB();
    $sql = "INSERT INTO answers (answer, question_id,  user_id) VALUES('" . htmlspecialchars($answer) . "', $question_id, $user_id)";
    mysqli_query($db, $sql);
}

function updateAnswer($answer, $answer_id)
{
    $db = connectDB();
    $sql = "UPDATE answers SET answer = '" . htmlspecialchars($answer) . "' WHERE id = $answer_id";
    mysqli_query($db, $sql);
}

function deleteAnswer($answer_id)
{
    $db = connectDB();
    $sql = "DELETE FROM answers WHERE id = $answer_id";
    mysqli_query($db, $sql);
}

function getAnswer($answer_id)
{
    $db = connectDB();
    $sql = "SELECT * FROM answers WHERE id = $answer_id";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result);
    return $row;
}

function getCurrentUserAnswers()
{
    $db = connectDB();
    $user_id = currentUserId();
    $sql = "SELECT a.*, AVG(r.rate) rate FROM answers a JOIN users u ON(u.id = a.user_id) LEFT JOIN ratings r ON(r.answer_id = a.id) WHERE a.user_id = $user_id GROUP BY a.id";
    $result = mysqli_query($db, $sql);
    $answers = array();
    while ($row = mysqli_fetch_array($result)) {
        $answers[] = $row;
    }
    return $answers;
}

function getQuestionAnswers($question_id)
{
    $db = connectDB();
    $sql = "SELECT a.*, u.name username, AVG(r.rate) rate FROM answers a JOIN users u ON(u.id = a.user_id) LEFT JOIN ratings r ON(r.answer_id = a.id) WHERE a.question_id = $question_id GROUP BY a.id";
    $result = mysqli_query($db, $sql);
    $answers = array();
    while ($row = mysqli_fetch_array($result)) {
        $answers[] = $row;
    }
    return $answers;
}

function checkIfUserDidAlreadyRatedAnswer($answer_id, $user_id)
{
    $db = connectDB();
    $sql = "SELECT id FROM ratings WHERE user_id = $user_id AND answer_id = $answer_id";
    $result = mysqli_query($db, $sql);
    $row = mysqli_fetch_array($result);
    return isset($row['id']);
}

function rateAnswer($answer_id,  $rate, $user_id)
{
    $db = connectDB();
    $sql = "INSERT INTO ratings (rate, answer_id, user_id) VALUES ($rate, $answer_id, $user_id)";
    mysqli_query($db, $sql);
}

function getAnswerComments($answer_id)
{
    $db = connectDB();
    $sql = "SELECT c.*, u.name username FROM comments c JOIN users u ON(u.id = c.user_id) WHERE c.answer_id = $answer_id GROUP BY c.id";
    $result = mysqli_query($db, $sql);
    $comments = array();
    while ($row = mysqli_fetch_array($result)) {
        $comments[] = $row;
    }
    return $comments;
}
