<?php
	$username = "root";
	$password = "6379133";
	$database = "uconnjobsearch";
	$address = "localhost";
	
	 // Create connection
    $mysqlConnection = new mysqli($address, $username, $password, $database);

    // Check connection
    if ($mysqlConnection->connect_error) {
        die("Connection failed: " . mysqli_connect_error());
	}
	echo "Connected successfully";	
	
	//check if username exists in the database
	
	$response =file_get_contents('http://localhost/sample_api/user_exists/');

?>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Register</title>
</head>

<body>
<form method="post" action="insert.php" name="send" onSubmit="return Check()">
  Account Information:<br>
  UserID:<br>
  <input type="text" name="username" size="20" class="c3a">
  <br>
  Email: <br>
  <label>
    <input name="email" type="email" id="email" placeholder="example@abc.com">
  </label>
  <label></label>
  <br>
  Password：<br>
  <input name="password" type="password" id="password">
  <br>
  Password Confirm：<br>
  <input name="cpassword" type="password" id="cpassword">
  <br>
  <br>
  Personal Information:<br>
  First Name：<br>
  <input type="text" name="firstname" size="20" class="c3a" placeholder="firstname">
  <br>
  Last Name：<br>
  <input type="text" name="lastname" size="20" class="c3a" placeholder="lastname">
  <br>
  Phone Number：<br>
  <input type="tel" name="tel" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  <br>
  <input type="tel" name="cell" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  <a>(optinal)</a> <br>
  Address：<br>
  <input type="text" name="addr1" size="20" class="c3a" placeholder="address line 1">
  <br>
  <input type="text" name="addr2" size="20" class="c3a" placeholder="address line 2">
  <a>(optinal)</a> <br>
  City：<br>
  <input type="text" name="city" size="20" class="c3a" placeholder="city">
  <br>
  Zipcode：<br>
  <input type="text" name="zipcode" size="20" class="c3a" placeholder="00000">
  <br>
  States: <br>
  <select name="state" >
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
  Fax: <br>
  <input type="tel" name="fax" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  <a>(optinal)</a> <br>
  HomePage: <br>
  <input type="tel" name="homepage" size="20" class="c3a">
  <a>(optinal)</a> <br>
  <br>
  <input type="submit" value="submit" >
  <input type="reset" value="redo">
</form>
<script language="javascript">

var exists = false;


function Check()
{
		if (document.send.username.value=="") 
	{
	        window.alert('Please enter your userID'); 
        
        return false;
    }
	/***
	exists=false;
    var urls = "/sample_api/user_exists/"+ document.send.username.value;
    
    jQuery.ajax({
    type: "GET",
    url: urls,
    contentType:"text",
    dataType:"text",
    success: function(data){ if (data == "1") exists=true;     },
    error: function(){alert('fail')},
    async:  false
    
    });
	***/
    
    if(exists){
         window.alert('UserID exists, please choose another');
         return false;
    }
    	if (document.send.firstname.value=="") 
    {
        window.alert('Please enter your first name'); 
        
        return false;
    }
	    if (document.send.lastname.value=="") 
    {
        window.alert('Please enter your last name'); 
        
        return false;
    }
	    if (document.send.email.value=="")
    {
        alert('Please enter your email address');
         
        return false;
    }
    	if (document.send.password.value=="") 
    {
        alert('Please enter your password'); 
        
        return false;
    }
	    if (document.send.cpassword.value=="") 
    {
        alert('Please confirm your password'); 
        
        return false;
    }
	    if (document.send.password.value!= document.send.cpassword.value) 
    {
        alert('Your passwords do not match'); 
        return false;
    }
    	if(document.send.email.value.indexOf("@")==-1)
    {
        alert('Please enter a vaild email address'); 
		return false;
    }
		if (document.send.addr1.value=="") 
	{
	        window.alert('Please enter your street address'); 
        
        return false;
    }
		if (document.send.city.value=="") 
	{
	        window.alert('Please enter your city'); 
        
        return false;
	}
		if (document.send.zipcode.value=="") 
	{
	        window.alert('Please enter your zipcode'); 
        
     return false;
    }
		  if (document.send.state.value=="") 
	   {
	        window.alert('Please select your state'); 
        
        return false;
    } 
	return true;
	}

	
</script>
</body>
</html>
