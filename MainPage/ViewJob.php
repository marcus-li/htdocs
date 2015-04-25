
 <!doctype html>
<html>
<head>
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
<meta charset="utf-8">
<title>Search</title>
<meta name="keywords" content="search">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="profile/Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->





<div class="sidebar">
  <h1>Job Search</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage" href="Main_Page.php">Main Page</a>
      <a class="HomePage">Search</a>
      <a class="HomePage" href="Manage_Application.php">Manage Applications</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->

</header>

<body>

<div class = "content" > 
<div style ="padding-top:80px; padding-left:80px;">

<?php
	include '../dbscripts/credentials.php';
	parse_str($_SERVER['QUERY_STRING'], $params);
	//echo $params['jobid'];
	$query = "Select * from job where jobid = ".$params['jobid'];
	 $conn = new mysqli($address, $username, $password, $database);
	 
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		$result = $conn->query($query);
		if($result->num_rows==0){
		echo "<h1>Job Not Found</h1>";
		}else{
			$row = $result->fetch_assoc();
			//Position - Company Name
			echo "<h2> ".ucfirst($row["JobTitle"])." - " .ucfirst($row["CompanyName"])." </h2>";
			//City, State
			echo "<h3>".ucfirst($row["JobCity"]).", " .ucfirst(strtolower($row["JobState"]))."</h3>";
			
			 echo "<table border='0' cellpadding='5' cellspacing='1'";
			 
			
		
			
			
			echo "<tr><td>Job Duties: </td><td>".$row["JobDuties"]."</td></tr>";
			
			echo "<tr><td>Expected Salary: </td><td>$".$row["JobJLowRange"]."-$".$row["JobHighRange"]."</td></tr>";
			
			echo "<tr><td>Required Years of Experience: </td><td>".$row["JobYRSExperience"]."</td></tr>";
			
			echo "<tr><td>Job Listed On: </td><td>".$row["JobListDate"]."</td></tr>";
			
			
			echo "</table>";
			  
			
			
			
			
		$result = $conn->query("SELECT * FROM resume WHERE SeekerId = '".  $_SESSION['login_user'].
		"'");
		if (!$result) {
		    echo "<b>database result error</b>";
			exit;
		}else if($result->num_rows==0){
		
		
		echo '<br><br><br><b> You may apply from this page once you have uploaded a resume to your profile. Click "Portfolio" in the navigation bar at the top to get started.</b>';
		}



		else {
		
		 
		  //build a dropdown menu of resumes for the user to use
		  ?>
		  <label>Choose a Resume: </label>
		  <select name="ResumeList" id = "resumelist" >
		  
		  <?php
		  while($row = $result->fetch_assoc()) 
			{
			//add row to select box
			 echo '<option title = "caption" value="'. $row["ResumeID"] . '">['. $row["ResumeFileName"].'] '.$row["Added"].'  </option>';
			   
			}
		  ?></select>
		  <?php
		  
		  echo "<br><br><input type='submit' value='Apply' onclick='go(".$params['jobid'].")'>";
		}
		$conn->close();
    }}
	?>
	
</div>
</div>

</body>

<script language = "javascript">

function go(jobID){
if (!window.confirm('Please confirm that you would like to apply to this job with the selected resume profile')) {
        return;
    }
	alert(jobID + " " + document.getElementById("resumelist").id);
}
</script>

</html>
