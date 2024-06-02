<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Replace these with your actual database connection details
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "demo_db";
// Create a connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Retrieve form data
    $email = $_POST["email"];
    $password = $_POST["password"];
    $name=$_POST["name"];

    // Check if the email is already registered
    $sql = "SELECT * FROM customer WHERE email = '$email'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        die("Email already registered.");
    }

    // Hash the password before saving it to the database
    // $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    $hashedPassword= $password;

    // Insert the new user into the "users" table
    $sql = "INSERT INTO customer (name, email, password) VALUES ('$name', '$email', '$hashedPassword')";

    if ($conn->query($sql) === TRUE) {
        echo "Signup successful.";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
