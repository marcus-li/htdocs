<?php
	include '../../../dbscripts/credentials.php';
	
	if(isset($_POST['submit']))
	{
		
	session_start();
	$sql = "INSERT INTO payment (PaymentAmount, PaymentStatus, Job_JobID, PaymentMethod) VALUES
    (
	'".$_POST["PaymentAmount"]."',
	'".$_POST["PaymentStatus"]."',
	'".$_POST["Job_JobID"]."', 
	'".$_POST["PaymentMethod"]."');";
	
	
			$result = NULL;
		  
			// Create connection
			$conn = new mysqli($address, $username, $password, $database);
			// Check connection	
			 if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			} else {
				$conn->multi_query($sql);
				$conn->close();
			}
	
	
	
	}else{
	echo "db error";
	}
	
	header("Location:Payment.php");
?>