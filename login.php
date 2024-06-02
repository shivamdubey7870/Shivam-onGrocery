<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// MySQL connection details
$servername = "localhost";
$username = "root";
$db_password = "";
$dbname = "demo_db";

// Check if the form is submitted
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve the submitted username (email) and password
    $email = $_POST["email"];
    $password = $_POST["password"];

    // Create a new PDO instance
    $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $db_password);
    
    // Prepare the SQL statement
    $stmt = $conn->prepare("SELECT * FROM customer WHERE email = :email");
    
    // Bind the email parameter
    $stmt->bindParam(':email', $email);
    
    // Execute the query
    $stmt->execute();
    
    // Fetch the row from the result set
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    
    // Validate the username (email) and password
    if ($password ==$row['password']) {
        // Successful login
        // Start the session
        session_start();

        // Store employee information in session variables
        $_SESSION['employee_id'] = $row['id'];
        $_SESSION['employee_name'] = $row['name'];
        $_SESSION['employee_email'] = $row['email'];

        // Redirect to the desired page or perform any other necessary actions
        echo "success";
    } else {
        // Invalid credentials
        echo "Invalid email or password. Please try again.";
        // You can display an error message on the login page or redirect back to the login page
    }
}
?>
