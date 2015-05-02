<?php
	include '../../../dbscripts/credentials.php';
	
	if(isset($_POST['cancel'])){
			$sql = 
				"DELETE from job 
				WHERE JobID='".$_POST["JobID"]."';
				DELETE from payment 
				WHERE PaymentID='".$_POST["PaymentID"]."';";
			
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
	$sql = "INSERT INTO onlineservice (ServiceName, ServiceTransitID, ServiceFee, PaymentID) VALUES
    (
	'".$_POST["ServiceName"]."',
	'".$_POST["ServiceTransitID"]."',
	'".$_POST["ServiceFee"]."', 
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
	header("Location:..\ReviewJobs.php");
?>