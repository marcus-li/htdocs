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
	elseif(isset($_POST['post']))
	{
		//JobDegreeTypes, JobDegreeAreas,
	session_start();
	$sql = "INSERT INTO job (JobTitle, JobCity, JobState, JobZip, JobDuties, JobYRSExperience, JobJLowRange, JobHighRange, JobFillStatus, PosterUserName, CompanyName, jobDescription) VALUES
    (
	'".$_POST["JobTitle"]."',
	'".$_POST["JobCity"]."', 
	'".$_POST["JobState"]."', 
	'".$_POST["JobZip"]."',
	'".$_POST["JobDuties"]."',
	'".$_POST["JobYRSExperience"]."',
	'".$_POST["JobJLowRange"]."',
	'".$_POST["JobHighRange"]."', 
	'".$_POST["JobFillStatus"]."',
	'".$_POST["PosterUserName"]."',
	'".$_POST["CompanyName"]."',
	'".$_POST["jobDescription"]."'
	);";
	
<<<<<<< HEAD
	//INSERT INTO `uconnjobsearch`.`job` (`JobTitle`, `JobCity`, `JobState`, `JobZip`, `JobDuties`, `JobYRSExperience`, `JobJLowRange`, `JobHighRange`, `JobFillStatus`, `PosterUserName`, `CompanyName`, `jobDescription`) VALUES ('Drawer', 'storr', 'CT', '06269', 'Draw', '4', '2500', '25000', 'No', 'bob', 'Georgia Institute of Technology', 'Draw');
	
	//'".$_POST["JobDegreeTypes"]."',
	//'".$_POST["JobDegreeAreas"]."', 
	//'".$_SESSION["login_user"]."',
	//'".$_POST["CompanyName"]."',

	
	
			$result = NULL;
=======
>>>>>>> c8fa6baf242e76bf2543510053567e52d59a04bc
		  
			// Create connection
			$conn = new mysqli($address, $username, $password, $database);
			// Check connection	
			 if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			} else {
				$result = $conn->multi_query($sql);
				if(!$result){
				header("HTTP/1.0 500 Fatal Error");
				echo "error: " .$conn->error. "<br>".$_POST["CompanyName"];
				exit();
				}
				$conn->close();
			}
	}else{
	echo "db error";
	}
	
	header("Location:Payment/Payment.php");
    ?>