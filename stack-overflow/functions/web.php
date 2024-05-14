<?php

function redirect(String $page)
{
    echo "<script>window.location.href='" . $page . "'</script>";
}

function alertMessage($message)
{
    echo "<script>alert('" . $message . "')</script>";
}

function isLoggedIn()
{
    return isset($_COOKIE['user_id']);
}

function currentUserId()
{
    return $_COOKIE['user_id'];
}

function logout()
{
    setcookie('user_id', null, time() - 3600, "/");
    unset($_COOKIE['user_id']); //will prevent \homepage.php
}
