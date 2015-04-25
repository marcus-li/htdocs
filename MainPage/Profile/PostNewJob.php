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
<title>UConn's Job Search (Poster)</title>
<meta name="keywords" content="Post New Job">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="../Main_Page.php">Seeker</a>
             <a href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1>UConn's Job Search (Poster)</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage">Post New Job</a>
      <a class="HomePage" href="ReviewJobs.php">Review Jobs Previously Posted</a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>
<!----page content -->

<!-- BEGIN CONTENT -->
<div class = "content">

<h3 class = "contentHeader">Post New Jobs:</h3>
<div style='padding-left:50px; padding-right:100px;'>
Create and Post new jobs. Exclusive option for Posters.
</div><br><hr><br>

<h3 class = "contentHeader">Company Information:</h3>

<!-- Company Info-->

<div style='padding-left:50px; padding-right:100px;'>
<form method ='post'>
            
    <?php
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM company WHERE CompanyId = '12'";
	
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
            
			<table border='0'><tr>
            
			<td>CompanyID: </td><td><input name="CompanyId" id="CompanyId" value="<?php echo $info["CompanyId"];?>" readonly/></td></tr>
			<td>CompanyName:</td> <td><input name = 'CompanyName' id="CompanyName" value="<?php echo $info["CompanyName"];?>" readonly/></td></tr>		
			<tr><td>Company Street: </td><td> <input  name = "CompanyStreet" id="CompanyStreet1" value="<?php echo $info["CompanyStreet1"];?>" readonly/></td></tr>
			<tr><td>Company City: </td><td> <input  name = "CompanyCity" id="CompanyCity" value="<?php echo $info["CompanyCity"];?>" readonly/></td></tr>
			<tr><td>Company Email: </td><td> <input  name = "CompanyEmail" id="CompanyEmail" value="<?php echo $info["CompanyEmail"];?>" readonly/></td></tr>
            <tr><td>Company Phone: </td><td> <input  name = "CompanyPhone" id="CompanyPhone" value="<?php echo $info["CompanyPhone"];?>" readonly/></td></tr>
            <tr><td>Company Fax: </td><td> <input  name = "CompanyFax" id="CompanyFax" value="<?php echo $info["CompanyFax"];?>" readonly/></td></tr>
            <tr><td>Company Home Page: </td><td> <input  name = "CompanyHomePage" id="CompanyHomePage" value="<?php echo $info["CompanyHomePage"];?>" readonly/></td></tr>
</table></form></div><br><hr><br>	


<h3 class = "contentHeader">Post a new Job:</h3>
<div style='padding-left:50px; padding-right:100px;'>

<!-- Post a new job-->

<form method ='post' action='postNewJob.php'>
			<table border='0'><tr>
            
			<td>JobId: </td><td><input name="JobId" id="JobId"/></td></tr>
			<td>Job List Date:</td> <td><input name = 'JobListDate' id="JobListDate"/></td></tr>		
			<tr><td>Company Name: </td><td> <input  name = "CompanyName" id="CompanyName" value="<?php echo $info["CompanyName"];?>" readonly/></td></tr>
			<tr><td>Job Title: </td><td> <input  name = "JobTitle" id="JobTitle"/></td></tr>
			<tr><td>Job City: </td><td> <input  name = "JobCity" id="JobCity" value="<?php echo $info["CompanyCity"];?>"/></td></tr>
            <tr><td>Job Zip: </td><td> <input  name = "JobZip" id="JobZip"/></td></tr>
            <tr><td>Job Duties: </td><td> <textarea  name = "JobDuties" id="JobDuties"></textarea></td></tr>
            <tr><td>Years of Experience: </td><td> <input  name = "JobYRSExperience" id="JobYRSExperience"/></td></tr>
            <tr><td>Job Degree Types: </td><td> <input  name = "JobDegreeType" id="JobDegreeType"/></td></tr>
            
            
            <tr><td>Job Degree Areas: </td><td> <input  name = "JobDegreeAreas" id="JobDegreeAreas"/></td></tr>
            
            
            <tr><td>Job Low Range: </td><td> <input  name = "JobJLowRange" id="JobJLowRange"/></td></tr>
            <tr><td>Job High Range: </td><td> <input  name = "JobHighRange" id="JobHighRange"/></td></tr>
            <tr><td>Job Fill Status: </td><td> <select  name = "JobFillStatus" id="JobFillStatus"><option value="Yes">Yes</option>
            	<option value="No" selected>No</option>
            </select></td></tr>
            
            <tr><td colspan='2' align='center'><br><input  type='submit' name = 'post' value = 'Post'></td></tr>
            
</table></form></div><br><hr><br>	
            
            
 <?php
	$conn->close();
?>
 
</div>
</body>
</html>





