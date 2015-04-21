<?php
	include '../../dbscripts/credentials.php';
	
	if(isset($_POST['update'])){
			$sql = 
				"UPDATE education SET 
				EducationUniversity='".$_POST["edu"]."',
				EducationDegreeType='".$_POST["degType"]."',
				EducationDegreeArea='".$_POST["degArea"]."', 
				EducationGPA='".$_POST["gpa"]."', 
				EducationStartDate='".$_POST["start"]."',
				EducationGradDate='".$_POST["grad"]."' 
				WHERE EduID='".$_POST["id"]."';";
			
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
				"DELETE from education 
				WHERE EduID='".$_POST["id"]."';";
			
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
	$sql = "INSERT INTO education (EducationUniversity, EducationDegreeType, EducationDegreeArea, EducationGPA, EducationStartDate, EducationGradDate, UserId) VALUES
    (
	'".$_POST["edu"]."',
	'".$_POST["degType"]."',
	'".$_POST["degArea"]."', 
	'".$_POST["gpa"]."', 
	'".$_POST["start"]."',
	'".$_POST["grad"]."',
	'".$_SESSION["login_user"]."');";
	
	
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
	
	header("Location:Update_Edu.php");
	
	

    ?>