<?php
	include '../../dbscripts/credentials.php';
	header('Content-type: text/plain');

	session_start();

	$sql = "Insert into resume (resumeid,seekerID) values (null, '".$_SESSION['login_user']."');";
	
	$result = NULL;
  
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		//add resume
	    $conn->query($sql);
		//link to user
		$resumeId = $conn->query("select LAST_INSERT_ID() as a;")->fetch_object()->a;	

		if(!$resumeId)
		{
		header("HTTP/1.0 500 Fatal Error");
		echo "Could not create new resume entry...error: " .$conn->error;
		exit();
		}
		echo $resumeId;
		$conn->close();
    }?>
	