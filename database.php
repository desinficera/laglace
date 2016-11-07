<?php
//define parameters
$host = "localhost";
$login = "phpuser"; //use differenct account if necessary
$password = "phpuser"; //use the correct password for the account
$database = "icecream";

//connect to mysql server
$conn = new mysqli($host, $login, $password, $database);

//handle connection errors
if ($conn->connect_errno) {
    $errno = $conn->connect_errno;
    $errmsg = $conn->connect_error;
    die ("Connection to database failed: ($errno) $errmsg.");
}
