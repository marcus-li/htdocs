<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Register</title>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.2.6/jquery.min.js"></script>
<meta name="keywords" content="register">
<link rel="stylesheet" type="text/css" href="stylesheet.css">

<SCRIPT type="text/javascript">

pic1 = new Image(16, 16); 
pic1.src = "loader.gif";

$(document).ready(function(){

$("#UserName").change(function() { 

var usr = $("#UserName").val();

if(usr.length >= 4)
{
$("#status").html('<img src="loader.gif" align="absmiddle">&nbsp;Checking availability...');

    $.ajax({  
    type: "POST",  
    url: "check_username.php",  
    data: "UserName="+ usr,  
    success: function(msg){  
   
   $("#status").ajaxComplete(function(event, request, settings){ 

	if(msg == 'OK')
	{ 
        $("#UserName").removeClass('object_error'); // if necessary
		$("#UserName").addClass("object_ok");
		$(this).html('&nbsp;<img src="tick.gif" align="absmiddle">');
	}  
	else  
	{  
		$("#UserName").removeClass('object_ok'); // if necessary
		$("#UserName").addClass("object_error");
		$(this).html(msg);
	}  
   
   });

 } 
   
  }); 

}
elseif(usr.length <= 4)
	{
	$("#UserName").removeClass('object_ok'); // if necessary
	$("#UserName").addClass("object_error");
	$("#status").html('<center><font color="red">The username should have at least <strong>4</strong> characters.</font></center>');
	}

});

});

//-->
</SCRIPT>
</head>
<body>
<?php
include '../dbscripts/credentials.php';
if(isset($_POST['submit']))
{

	$dbhost = $address ;
	$dbuser = $username;
	$dbpass = $password;

	$conn = mysql_connect($dbhost, $dbuser, $dbpass);
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
	   $UserStreet1 = addslashes ($_POST['UserAddress1']);
	   $UserStreet2 = addslashes ($_POST['UserAddress2']);
	   $UserCity = addslashes ($_POST['UserCity']);
	   $UserState = addslashes ($_POST['UserState']);
	   $UserZip = addslashes ($_POST['UserZip']);
	   $UserEmail = addslashes ($_POST['UserEmail']);
	   $UserPhone = addslashes ($_POST['UserPhone']);
	}
	else
	{
	   $UserName = $_POST['UserName'];
	   $UserPassword = $_POST['UserPassword'];
	   $UserFirstName = $_POST['UserFirstName'];
	   $UserLastName = $_POST['UserLastName'];
	   $UserStreet1 = $_POST['UserAddress1'];
	   $UserStreet2 = $_POST['UserAddress2'];
	   $UserCity = $_POST['UserCity'];
	   $UserState = $_POST['UserState'];
	   $UserZip = $_POST['UserZip'];
	   $UserEmail = $_POST['UserEmail'];
	   $UserPhone = $_POST['UserPhone'];
	}

	$sql = "INSERT INTO user ".
		   "(UserName, UserPassword, UserFirstName, UserLastName, UserStreet1, UserStreet2, UserCity, UserState, UserZip, UserEmail, UserPhone) ".
		   "VALUES('$UserName','$UserPassword', '$UserFirstName', '$UserLastName', '$UserStreet1', '$UserStreet2', '$UserCity', '$UserState', '$UserZip', '$UserEmail', '$UserPhone')";
		   
	mysql_select_db($database);
	$retval = mysql_query( $sql, $conn);

	if(!$retval or mysql_errno() == 1062)
	{
			/*if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
				$uri = 'https://';
			} else {
				$uri = 'http://';
			}
			$uri .= $_SERVER['HTTP_HOST'];
			header('Location: '.$uri.'/Registration/wrong_username.php');
			exit;*/
			echo "dberror";
		
		
	}else{
		$sql = "insert into seeker (username) values ('".$UserName."')";
		mysql_query( $sql, $conn);
		if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
				$uri = 'https://';
			} else {
				$uri = 'http://';
			}
			$uri .= $_SERVER['HTTP_HOST'];
			session_start();
			$_SESSION['login_user'] = $UserName;
			header('Location: '.$uri.'/Registration/registration_success.php');
			mysql_close($conn);
			exit;
	}
}
else
{
?>
<h1>Uconn's Job Search Register</h1>

<div class="frame">
<form method="post" action="<?php $_PHP_SELF ?>" name="send" onSubmit="return Check()">
  <h2>Account Information:</h2><br>
  <a>UserID:</a>
  <input type="text" name="UserName" size="20" id="UserName" class="c3a">
  <a id="status"></a>
  <br>
  <a>Email:</a>
    <input name="UserEmail" type="email" id="UserEmail" placeholder="example@abc.com">
  <br>
  <a>Password：</a>
  <input name="password" type="password" id="password">
  <br>
  <a>Password Confirm：</a>
  <input name="UserPassword" type="password" id="UserPassword">
  <br>
  <br>
  <h2>Personal Information:</h2><br>
  <a>First Name：</a>
  <input type="text" name="UserFirstName" size="20" id="UserFirstName" class="c3a" placeholder="firstname">
  <br>
  <a>Last Name：</a>
  <input type="text" name="UserLastName" size="20" id="UserLastName" class="c3a" placeholder="lastname">
  <br>
  <a>Phone Number：</a>
  <input type="tel" name="UserPhone" size="20" id="UserPhone" class="c3a" placeholder="(xxx)xxx-xxxx">
  <br>
  <input type="tel" class="cell" name="UserCell" size="20" placeholder="(xxx)xxx-xxxx">
  (Optional) <br>
  <a>Address：</a>
  <input type="text" name="UserAddress1" size="20" class="c3a" placeholder="address line 1">
  <br>
  <input type="text" class="addr2" name="UserAddress2" size="20" placeholder="address line 2">
  (Optional) <br>
  <a>City：</a>
  <input type="text" name="UserCity" size="20" class="c3a" placeholder="city">
  <br>
  <a>Zipcode：</a>
  <input type="text" name="UserZip" size="20" class="c3a" placeholder="00000">
  <br>
  <a>States:</a>
  <select name="UserState" id="UserState">
    <option value="">Please select</option>
    <option value="Alabama">Alabama</option>
    <option value="Alaska">Alaska</option>
    <option value="Arizaona">Arizaona</option>
    <option value="Arkansas">Arkansas</option>
    <option value="California">California</option>
    <option value="Colorado">Colorado</option>
    <option value="Connecticut">Connecticut</option>
    <option value="Delaware">Delaware</option>
    <option value="District of Columbia">District of Columbia</option>
    <option value="Florida">Florida</option>
    <option value="Georgia">Georgia</option>
    <option value="Hawaii">Hawaii</option>
    <option value="Idaho">Idaho</option>
    <option value="Illinois">Illinois</option>
    <option value="Indiana">Indiana</option>
    <option value="Iowa">Iowa</option>
    <option value="Kansas">Kansas</option>
    <option value="Kentucky">Kentucky</option>
    <option value="Louisiana">Louisiana</option>
    <option value="Maine">Maine</option>
    <option value="Maryland">Maryland</option>
    <option value="Massachusetts">Massachusetts</option>
    <option value="Michigan">Michigan</option>
    <option value="Minnesota">Minnesota</option>
    <option value="Mississippi">Mississippi</option>
    <option value="Missouri">Missouri</option>
    <option value="Montana">Montana</option>
    <option value="Nebraska">Nebraska</option>
    <option value="Nevada">Nevada</option>
    <option value="ew Hampshire">New Hampshire</option>
    <option value="New Jersey">New Jersey</option>
    <option value="New Mexico">New Mexico</option>
    <option value="New York">New York</option>
    <option value="North Carolina">North Carolina</option>
    <option value="North Dakota">North Dakota</option>
    <option value="Ohio">Ohio</option>
    <option value="Oklahoma">Oklahoma</option>
    <option value="Oregon">Oregon</option>
    <option value="Pennsylvania">Pennsylvania</option>
    <option value="Puerto Rico">Puerto Rico</option>
    <option value="Rhode Island">Rhode Island</option>
    <option value="South Carolina">South Carolina</option>
    <option value="South Dakota">South Dakota</option>
    <option value="Tennessee">Tennessee</option>
    <option value="Texas">Texas</option>
    <option value="Utah">Utah</option>
    <option value="Vermont">Vermont</option>
    <option value="Virgin Islands">Virgin Islands</option>
    <option value="Virginia">Virginia</option>
    <option value="Washington">Washington</option>
    <option value="West Virginia">West Virginia</option>
    <option value="Wisconsin">Wisconsin</option>
    <option value="Wyoming">Wyoming</option>
  </select> 
  <br>
  <a>Fax: </a>
  <input type="tel" name="fax" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  (Optional) <br>
  <a>Home Page: </a>
  <input type="tel" name="homepage" size="20" class="c3a">
  (Optional) <br>
  <b>
  <input class="button" type="submit" value="Submit" name="submit" id="button">
  <input class="button" type="reset" value="Redo">
  <div>
  <b class="login" id="Login"><a href="../Login/login_main.php">Already registered? Login</a></b>
  </div>
</form>
</div>
<script language="javascript">

var exists = false;


function Check()
{
		if (document.send.UserName.value=="") 
	{
	        window.alert('Please enter your userID'); 
        
        return false;
    }    
	  if (document.send.UserEmail.value=="")
    {
        alert('Please enter your email address');
         
        return false;
    }
	   	if(document.send.UserEmail.value.indexOf("@")==-1)
    {
        alert('Please enter a vaild email address'); 
		return false;
    }
    if(exists){
         window.alert('UserID exists, please choose another');
         return false;
    }
    
	  
    	if (document.send.password.value=="") 
    {
        alert('Please enter your password'); 
        
        return false;
    }
	    if (document.send.UserPassword.value=="") 
    {
        alert('Please confirm your password'); 
        
        return false;
    }
	    if (document.send.password.value!= document.send.UserPassword.value) 
    {
        alert('Your passwords do not match'); 
        return false;
    }
		if (document.send.UserFirstName.value=="") 
    {
        window.alert('Please enter your first name'); 
        
        return false;
    }
	    if (document.send.UserLastName.value=="") 
    {
        window.alert('Please enter your last name'); 
        
        return false;
    }
 
		if (document.send.UserAddress1.value=="") 
	{
	        window.alert('Please enter your street address'); 
        
        return false;
    }
		if (document.send.UserCity.value=="") 
	{
	        window.alert('Please enter your city'); 
        
        return false;
	}
		if (document.send.UserZip.value=="") 
	{
	        window.alert('Please enter your zipcode'); 
        
     return false;
    }
		  if (document.send.UserState.value=="") 
	   {
	        window.alert('Please select your state'); 
        
        return false;
    } 
	return true;
	}
</script>
 <?php
}
?>
</body>
</html>