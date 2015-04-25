<?php
	include '../../dbscripts/credentials.php';
	if(!isset($_POST["email"])){
		echo " POST variables not set";
		exit;
	}
	
	
	
	
	session_start();
	$sql ="";
	if(strlen($_POST["password"])==0){
	$sql = "Update User SET 
			UserFirstName = '".$_POST["firstname"]."',
			UserLastName = '".$_POST["lastname"]."',
			UserStreet1 = '".$_POST["street1"]."',
			UserStreet2 = '".$_POST["street2"]."',
			UserCity = '".$_POST["city"]."',
			UserState = '".$_POST["state"]."',
			UserZip = '".$_POST["zip"]."',
			UserEmail = '".$_POST["email"]."',
			UserPhone = '".$_POST["homephone"]."',
			UserFax = '".$_POST["fax"]."',
			UserCell = '".$_POST["cellphone"]."',
			UserHomePage = '".$_POST["homepage"]."'
			WHERE
				UserName = '".$_SESSION["login_user"]."';";
	}else{
	
	$sql = "Update User SET 
			UserFirstName = '".$_POST["firstname"]."',
			UserLastName = '".$_POST["lastname"]."',
			UserStreet1 = '".$_POST["street1"]."',
			UserStreet2 = '".$_POST["street2"]."',
			UserCity = '".$_POST["city"]."',
			UserPassword = '".$_POST["password"]."',
			UserState = '".$_POST["state"]."',
			UserZip = '".$_POST["zip"]."',
			UserEmail = '".$_POST["email"]."',
			UserPhone = '".$_POST["homephone"]."',
			UserFax = '".$_POST["fax"]."',
			UserCell = '".$_POST["cellphone"]."',
			UserHomePage = '".$_POST["homepage"]."'
			WHERE
				UserName = '".$_SESSION["login_user"]."';";
				
				
				}

	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $conn->query($sql);
		echo "updated";
		$conn->close();
		header("Location:User_Settings.php");
    }?>
	