<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);

// Get the data from the Ajax request
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $email = $_POST["email"];
    $cartItems = $_POST["cartItems"];
    $price =$_POST["totalAmount"];

    // Ensure that the necessary data is present
    if (!empty($email) && is_array($cartItems) && count($cartItems) > 0) {
        // Process and save the data to the database
        saveToDatabase($email, $cartItems, $price);
        echo "Ordered successfully";
    } else {
        echo "Invalid data received";
    }
}

function saveToDatabase($email, $cartItems, $price) {
    // Create a database connection (replace with your actual database credentials)
    $dbHost = "localhost";
    $dbUser = "root";
    $dbPass = "";
    $dbName = "demo_db";

    $conn = new mysqli($dbHost, $dbUser, $dbPass, $dbName);

    // Check the connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Escape the user email to prevent SQL injection
    $email = $conn->real_escape_string($email);
    $cartItemsJson = json_encode($cartItems);


    // Prepare and insert the cart items into the cart_items table
    $sql = "INSERT INTO customerOrder (customer_email, order_details, orderAmount) VALUES (?, ?, ?)";
    $stmt = $conn->prepare($sql);

   
        // Bind parameters and execute the query
        $stmt->bind_param("sss", $email, $cartItemsJson, $price);
        $stmt->execute();

    // Close the prepared statement and database connection
    $stmt->close();
    $conn->close();
}
?>
