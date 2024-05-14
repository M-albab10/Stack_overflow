<?php
function connectDB()
{
    $servername = "127.0.0.1"; // Use '127.0.0.1' instead of 'localhost' to avoid socket connection issues
    $username = "root";
    $password = "";
    $dbname = "stack_overflow"; // Specify your database name here
    $port = 3308; // Specify the new port number here

    // Create connection
    $db = mysqli_connect($servername, $username, $password, $dbname, $port);

    // Check connection
    if (!$db) {
        die("Connection failed: " . mysqli_connect_error());
    }

    return $db;
}
?>
