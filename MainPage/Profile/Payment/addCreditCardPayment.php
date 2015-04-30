<?php
	include '../../../dbscripts/credentials.php';
	
	if(isset($_POST['cancel'])){
			$sql = 
				"DELETE from job 
				WHERE JobID='".$_POST["PaymentID"]."';";
			
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
	
	}
	elseif(isset($_POST['submit']))
	{
	session_start();
	$sql = "INSERT INTO creditcard (CreditCardNumber, CreditCardType, CreditCardExpirDate, CreditCardDate, PaymentID) VALUES
    (
	'".$_POST["CreditCardNumber"]."',
	'".$_POST["CreditCardType"]."',
	'".$_POST["CreditCardExpirDate"]."',
	'".$_POST["CreditCardDate"]."', 
	'".$_POST["PaymentID"]."');";
	
	
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
	header("Location:..\PostNewJob.php");
?>