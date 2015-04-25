<?php
	include '../../dbscripts/credentials.php';

	session_start();
	$sql = "select UserPassword from user where username ='".$_SESSION["login_user"]."';";

	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		echo $result->fetch_assoc()["UserPassword"];
		$conn->close();
    }?>
	