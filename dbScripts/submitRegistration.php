<?php
include 'credentials.php';
$conn = new mysqli($address, $username, $password, $database);

if(! $conn )
{
  die('Could not connect: ' . mysql_error());
}

if(! get_magic_quotes_gpc() )
{
   $UserName = addslashes ($_POST['UserName']);
   $UserPassword = addslashes ($_POST['UserPassword']);
   $UserFirstName = addslashes ($_POST['UserFirstName']);
   $UserLastName = addslashes ($_POST['UserLastName']);
   $UserStreet1 = addslashes ($_POST['UserStreet1']);
   $UserStreet2 = addslashes ($_POST['UserStreet2']);
   $UserCity = addslashes ($_POST['UserCity']);
   $UserState = addslashes ($_POST['UserState']);
   $UserZip = addslashes ($_POST['UserZip']);
   $UserEmail = addslashes ($_POST['UserEmail']);
   $UserPhone = addslashes ($_POST['UserPhone']);
   $UserFax = addslashes ($_POST['UserFax']);
   $UserCell = addslashes ($_POST['UserCell']);
   $UserHomePage = addslashes ($_POST['UserHomePage']);
}
else
{
   $UserName = $_POST['UserName'];
   $UserPassword = $_POST['UserPassword'];
   $UserFirstName = $_POST['UserFirstName'];
   $UserLastName = $_POST['UserLastName'];
   $UserStreet1 = $_POST['UserStreet1'];
   $UserStreet2 = $_POST['UserStreet2'];
   $UserCity = $_POST['UserCity'];
   $UserState = $_POST['UserState'];
   $UserZip = $_POST['UserZip'];
   $UserEmail = $_POST['UserEmail'];
   $UserPhone = $_POST['UserPhone'];
   $UserFax = $_POST['UserFax'];
   $UserCell = $_POST['UserCell'];
   $UserHomePage = $_POST['UserHomePage'];
   
}

$sql = "INSERT INTO user ".
       "(UserName, UserPassword, UserFirstName, UserLastName, UserStreet1, UserStreet2, UserCity, UserState, UserZip, UserEmail, UserPhone, UserFax,UserCell,UserHomePage) ".
       "VALUES('$UserName','$UserPassword', '$UserFirstName', '$UserLastName', '$UserStreet1', '$UserStreet2', '$UserCity', '$UserState', '$UserZip', '$UserEmail', '$UserPhone', '$UserFax', '$UserCell', '$UserHomePage')";
	   
 // Check connection	
 $result = NULL;
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
	else {
	    $result = $conn->query($sql);
		}
		$conn->close();
			
	if(!$result or mysql_errno() == 1062){
	echo "error connecting to database";
	//header( 'href: http://www.yahoo.com' ) ;
	}else{
	//header( 'Location: http://www.google.com' ) ;
	echo "success";
}

?>