<?php
	include '../../dbscripts/credentials.php';
	
	if(!isset($_POST['s'])){
	echo var_dump($_POST);
	echo "no data";
	exit;
	
	}
	$sql = $_POST['s'];
	$result = NULL;
  
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $conn->multi_query($sql);
		$conn->close();
    }?>