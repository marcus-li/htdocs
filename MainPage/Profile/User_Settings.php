<!doctype html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<html>
<?php session_start();
if(!isset($_SESSION['login_user'])){
	
	//in case of using back in browser after logging out
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
				$uri = 'https://';
			} else {
				$uri = 'http://';
			}
			$uri .= $_SERVER['HTTP_HOST'];
			header('Location: '.$uri.'/login/login_main.php');
			exit;
	};?>
<head>
<meta charset="utf-8">
<title>Update Profile</title>
<meta name="keywords" content="Update resume">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
  <div class="topbar">
    <div class="navbutton">
      <nav> <a class="HomePage" href="../Main_Page.php">Main Page</a> <a href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a> </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- topbar -->
  
  <div class="sidebar">
    <h1><img src="../../MainPage_img/Update Profile.png"></h1>
    <div class="navbutton">
      <nav> <a class="side_button" href="Update_Resume.php">Resume</a> <a class="side_button" href="Update_Edu.php">Education background</a> <a class="side_button" href="Update_Exp.php">Work Experience</a> <a class="side_button_select" >Profile Settings</a> </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- sidebar --> 
</header>
<!----page content -->

<div class="content" ><br>
  <br>
  <br>
  <br>
  <div style = "padding-left: 80px">
  <form method="post" action="updateUserDetails.php" name="send" onSubmit="return check()">
    <?php
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM user WHERE username = '".  $_SESSION['login_user'].
		"'";
	
	$result = NULL;
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		$info = $result->fetch_assoc();
		if (!$result) {
		    echo "<b>database result error</b>";
			exit;
		} 
    }?>
    <table>
      <tr>
        <td> First Name: </td>
        <td><input type = "text" name = "firstname" id = "firstname" value= "<?php echo $info["UserFirstName"];?>"/></td>
      </tr>
      <tr>
        <td> Last Name: </td>
        <td><input type = "text" name = "lastname" id = "lastname" value= "<?php echo $info["UserLastName"];?>"/></td>
      </tr>
      <tr>
        <td> Change Password: </td>
        <td><input type = "password"  id="password" name ="password" placeholder = "*****"/></td>
      </tr>
      <tr>
        <td> Confirm Password: </td>
        <td><input type = "password" id="confirmpassword" name="confirmpassword"  placeholder = "*****"/></td>
      </tr>
      <tr>
        <td> Street 1: </td>
        <td><input type = "text" name = "street1" id="street1" value= "<?php echo $info["UserStreet1"];?>"/></td>
      </tr>
      <tr>
        <td> Street 2: </td>
        <td><input type = "text" name = "street2" id="street2" value= "<?php echo $info["UserStreet2"];?>"/></td>
      </tr>
      <tr>
        <td> City: </td>
        <td><input type = "text" name = "city" id="city" value= "<?php echo $info["UserCity"];?>"/></td>
      </tr>
      <tr>
        <td> State: </td>
        <td><select name="state" id="state">
            <option value="<?php echo $info["UserState"];?>"><?php echo $info["UserState"];?></option>
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
          </select></td>
      </tr>
      <tr>
        <td> Zip: </td>
        <td><input type = "text" name = "zip" id="zip" value= "<?php echo $info["UserZip"];?>"/></td>
      </tr>
      <tr>
        <td> Email: </td>
        <td><input type = "text" name = "email" id="email" value= "<?php echo $info["UserEmail"];?>"/></td>
      </tr>
      <tr>
        <td> Home Phone: </td>
        <td><input type = "text" name = "homephone" value= "<?php echo $info["UserPhone"];?>"/></td>
      </tr>
      <tr>
        <td> Cell Phone: </td>
        <td><input type = "text" name = "cellphone" value= "<?php echo $info["UserCell"];?>"/></td>
      </tr>
      <tr>
        <td> Fax: </td>
        <td><input type = "text" name = "fax" value= "<?php echo $info["UserFax"];?>"/></td>
      </tr>
      <tr>
        <td> Home Page: </td>
        <td><input type = "text" name = "homepage" value= "<?php echo $info["UserHomePage"];?>"/></td>
      </tr>
      <tr>
        <td><b>Old password: </b></td>
        <td><input type ="password" name="oldpassword" value= "" placeholder = "*****"/></td>
      </tr>
    </table>
    
    <!--button to select new resume-->
    <input class="button" type="submit" value="confirm changes" name="submitBtn" id="button" >
    <br>
    <br>
    </div>
    <hr>
  </form>
  <?php
	$conn->close();
?>
</div>
</body>
<script language="javascript">

 function check(){
				if (document.send.firstname.value=="") {
				window.alert('Please enter your first name'); 
				return false;
			} 
		
		 	if (document.send.lastname.value.trim()==""){
				window.alert('Please enter your last name'); 
				return false;
			} 
		
			
			if (document.send.street1.value.trim()=="") 
			{
					window.alert('Please enter your street address'); 
				
				return false;
			} 
			
				if (document.send.city.value.trim()=="") 
			{
					window.alert('Please enter your city'); 
				
				return false;
			} 
			
				if (document.send.zip.value.trim()=="") 
			{
					window.alert('Please enter your zip code'); 
				
				return false;
			} 
			
				if (document.send.email.value.trim()=="") 
			{
					window.alert('Please enter your email'); 
				
				return false;
			} 
		 
			var pass1 = document.getElementById("password").value.trim();
			
			var pass2 = document.getElementById("confirmpassword").value.trim();
		
		  if (!(pass1==pass2)) {
					window.alert('new password confirmation does not match'); 
				return false;
			} 
		 
		 var isCorrect = false;
		 var pass = "";
		var oldpass = "";
		  oldpass = document.send.oldpassword.value;
		  
		  $.ajax({
			type : "POST",
			url : "passwordValidate.php",	
			dataType: "text",
			success:function(data){	pass = data;},
			async: false
		});
		
			if(pass.trim()==oldpass.trim())	isCorrect=true;
				

		 if (!isCorrect) 
			{
				window.alert('invalid password, please enter your old password to confirm changes'); 
				return false;
			}
				
			
			
		 	
		 return true;
 
	}
 </script>
</html>
