<?php
	include '../../dbscripts/credentials.php';
	
	if(isset($_POST['update'])){
			$sql = 
				"UPDATE job SET 
				JobListDate='".$_POST["JobListDate"]."',
				JobTitle='".$_POST["JobTitle"]."', 
				JobCity='".$_POST["JobCity"]."', 
				JobState='".$_POST["JobState"]."',
				JobZip='".$_POST["JobZip"]."' ,
				JobDuties='".$_POST["JobDuties"]."', 
				JobYRSExperience='".$_POST["JobYRSExperience"]."', 
				JobDegreeTypes='".$_POST["JobDegreeTypes"]."',
				JobDegreeAreas='".$_POST["JobDegreeAreas"]."' ,
				JobJLowRange='".$_POST["JobJLowRange"]."', 
				JobHighRange='".$_POST["JobHighRange"]."', 
				JobFillStatus='".$_POST["JobFillStatus"]."',
				PosterUserName='".$_POST["PosterUserName"]."' ,
				CompanyName='".$_POST["CompanyName"]."',
				JobDescription='".$_POST["JobDescription"]."'
				WHERE JobID='".$_POST["JobID"]."';";
			
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
				"DELETE from job 
				WHERE JobID='".$_POST["JobID"]."';";
			
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
	$sql = "INSERT INTO job (JobListDate, JobTitle, JobCity, JobState, JobZip, JobDuties, JobYRSExperience, JobDegreeTypes, JobDegreeAreas, JobJLowRange, JobHighRange, JobFillStatus, PosterUserName, CompanyName, JobDescription) VALUES
    (
	'".$_POST["JobListDate"]."',
	'".$_POST["JobTitle"]."',
	'".$_POST["JobCity"]."', 
	'".$_POST["JobState"]."', 
	'".$_POST["JobZip"]."',
	'".$_POST["JobDuties"]."',
	'".$_POST["JobYRSExperience"]."',
	'".$_POST["JobDegreeTypes"]."',
	'".$_POST["JobDegreeAreas"]."', 
	'".$_POST["JobJLowRange"]."',
	'".$_POST["JobHighRange"]."', 
	'".$_POST["JobFillStatus"]."',
	'".$_SESSION["login_user"]."',
	'".$_POST["CompanyName"]."',
	'".$_POST["JobDescription"]."'
	);";
	
	
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
	
	header("Location:Payment/Payment.php");
	
	

    ?>