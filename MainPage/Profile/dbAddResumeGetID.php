<?php
	include '../../dbscripts/credentials.php';
	header('Content-type: text/plain');
	if(!isset($_POST['sql'])){
	echo var_dump($_POST);
	echo "no data";
	exit;
	
	}
	session_start();
	$sql = $_POST['sql'];
	
	$result = NULL;
  
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		//add resume
	    $conn->multi_query($sql);
		
		//link to user
		$resumeId = $conn->query("select LAST_INSERT_ID() as a;")->fetch_object()->a;
		$conn->query("Insert into seeker (UserName, ResumeId) values 
			
			('". $_SESSION["login_user"]."',".$resumeId .");");
		
		echo $resumeId;
		$conn->close();
    }?>
	