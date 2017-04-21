<?php
$servername = "localhost";
$username = "fastberry";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";

// close the connection
$conn->close();
?>

