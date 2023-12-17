<?php
$servername = "localhost";
$username = "hoteladmin";
$password = "admin";
$dbname = "amanecerdoradohotel";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}
?>
