<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
// Replace these database details with your actual credentials
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "demo_db";

// Establish a connection to the MySQL database
$mysqli = new mysqli($servername, $username, $password, $dbname);

// Check the connection
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// Check if the 'email' parameter exists in the URL (sent from the email link)
if (isset($_GET['email']) && !empty($_GET['email'])) {
    // Sanitize the 'email' parameter to prevent SQL injection
    $customerEmail = $mysqli->real_escape_string($_GET['email']);

    // Fetch the product details from the database based on the provided 'email'
    $sql = "SELECT * FROM customerOrder WHERE customer_email = '$customerEmail' order by order_id desc";
    $result = $mysqli->query($sql);

    if ($result->num_rows > 0) {
        // Product found
        $orderHistory = [];
        while ($product = $result->fetch_assoc()) {
            $order = [
                'dateTime' => $product['dateTime'],
                'order_details' => json_decode($product['order_details']),
                'orderAmount' => $product['orderAmount'],
            ];
            $orderHistory[] = $order;
        }

        $jsonOrderHistory = json_encode($orderHistory, JSON_PRETTY_PRINT);
        echo $jsonOrderHistory;
    } else {
        // // Product not found
        // $order = [
        //     'mesage' => '<div class="alert alert-danger" role="alert">Product not found.</div>',
        // ];
        // $message[] =$order;
        // $warning = json_encode($message, JSON_PRETTY_PRINT);
        // echo $warning;
    }
} else {
    // 'email' parameter not found in the URL
    echo '<div class="alert alert-danger" role="alert">Invalid product link.</div>';
}

// Close the database connection
$mysqli->close();
?>
