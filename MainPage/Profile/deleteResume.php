<?php
	include '../../dbscripts/credentials.php';
	if(!isset($_POST["resumeID"])){
		echo " not set";
		exit;
	}
	$sql = "Delete from resume where resumeid ='".$_POST["resumeID"]."';";

	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $conn->query($sql);
		echo "deleted resume";
		$conn->close();
    }?>
	