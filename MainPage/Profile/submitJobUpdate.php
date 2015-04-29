<?php
	include '../../dbscripts/credentials.php';
	
	if(isset($_POST['update'])){
	
	
	
			$sql = 
				"UPDATE priorjobs SET 
				PJCompanyName='".$_POST["company"]."',
				PJJobTitle='".$_POST["position"]."',
				PJDuties='".$_POST["duties"]."', 
				PJCity='".$_POST["city"]."', 
				PJState='".$_POST["state"]."',
				PJStartDate='".$_POST["start"]."',
				PJEndDate='".$_POST["end"]."' 
				WHERE JobID='".$_POST["id"]."';";
			
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
	}elseif(isset($_POST['delete'])){
			$sql = 
				"DELETE from priorjobs 
				WHERE JobID='".$_POST["id"]."';";
			
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
	elseif(isset($_POST['add']))
	{
	session_start();
	
	
		$end = $_POST["end"];
		if($end == "") $end = "Current Employee";
	
	if(!$_POST["company"]=="") {
	$sql = "INSERT INTO priorjobs (PJCompanyName, PJJobTitle, PJDuties, PJCity,PJState, PJStartDate,PJEndDate,UserId) VALUES(
	'".$_POST["company"]."',
	'".$_POST["position"]."',
	'".$_POST["duties"]."', 
	'".$_POST["city"]."', 
	'".$_POST["state"]."',
	'".$_POST["start"]."',
	'".$end."',
	'".$_SESSION["login_user"]."');";
	
	
			$result = NULL;
		  
			// Create connection
			$conn = new mysqli($address, $username, $password, $database);
			// Check connection	
			 if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
				exit;
			} else {
				$conn->multi_query($sql);
				$conn->close();
			}
	
	}
	}else{
	echo "db error";
	}
	
	header("Location:Update_Exp.php");
	
	

    ?>