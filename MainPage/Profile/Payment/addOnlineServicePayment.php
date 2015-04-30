<?php
	include '../../../dbscripts/credentials.php';
	
	if(isset($_POST['cancel'])){
			$sql = 
				"DELETE from job 
				WHERE JobID='".$_POST["Job_JobID"]."';";
				
			$sql1 = 
				"DELETE from payment 
				WHERE PaymentID='".$_POST["PaymentID"]."';";
			
			$result = NULL;
		  
			// Create connection
			$conn = new mysqli($address, $username, $password, $database);
			// Check connection	
			 if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			} else {
				$conn->multi_query($sql);
				$conn->multi_query($sql1);
				$conn->close();
			}
	
	}
	elseif(isset($_POST['submit']))
	{
	session_start();
	$sql = "INSERT INTO bankpayment (BankPaymentName, BankPaymentNumber, BankPaymentAcctNumber, PaymentID) VALUES
    (
	'".$_POST["BanPaymentName"]."',
	'".$_POST["BankPaymentNumber"]."',
	'".$_POST["BankPaymentAcctNumber"]."', 
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