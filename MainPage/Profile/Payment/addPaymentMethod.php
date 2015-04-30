<?php
	// Do action for Finish
	// add payment method info to its correct payment method. Show alert confirming payment and successful creation of new job and go back to review jobs posted.
	
	
	// Do action for Cancel
	// delete job just posted because payment was not succesfull, go back to postNewJob.
     if($_POST){
        $PaymentMethod=$_POST['PaymentMethod'];
     }
?>

<?php
	include '../../dbscripts/credentials.php';
	
	if(isset($_POST['cancel'])){
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
	elseif(isset($_POST['submit']))
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
	
	header("Location:..\PostNewJob.php");
	
	

?>