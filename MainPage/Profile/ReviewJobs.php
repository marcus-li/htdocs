<!doctype html>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

  <script src="jquery-ui.min.js"></script>
 
  
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
<title>Review Jobs Previously Posted (Poster)</title>
<meta name="keywords" content="Review Jobs">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
<link href="jquery-ui.css" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>	
<script language = "javascript">
function go(jobID){
	location.assign("viewPostedJob.php?jobid="+jobID);
}
</script>
<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
            <a class="topbutton" href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1><img  src="../../MainPage_img/ReviewPreviousJob.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button" href="PostNewJob.php">Post New Job</a>
      <a class="side_button_select">Review Previous Jobs</a>
      <a class="side_button" href="Poster_Settings.php">Profile Settings</a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>


<!-- BEGIN CONTENT -->
<div class = "content" >
  <div style ="padding-top:80px; padding-left:80px;padding-right:30px;overflow:auto">
    <h2>Previously Posted Jobs</h2>
    
<?php
	include '../../dbscripts/credentials.php';
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
		exit;
    }
	$sql = "SELECT * FROM job WHERE PosterUserName = '".$_SESSION["login_user"]."'";
	
	
	$result = NULL;
    
	
	// Check connection	
	
	$result = $conn->query($sql);
	if (!$result) {
		exit;
	}
		//calculate how many row slots we have left
		$secondQueryLimit = 10-$result->num_rows;
		
	  $array = array();	
	  
	  echo "<table border='2' cellpadding='2' cellspacing='2'";
		echo "<tr><td></td><td>Job Title</td><td>Job List Date</td>
				<td>Company Name</td><td>Job Fill Status</td>";
		$jobslisted = null;
		   while($row = $result->fetch_assoc()) 
		   {

		   $jobslisted[' '.$row["JobID"]] = 1;

		   echo "<tr>";
				echo "<td><input type ='submit' value = 'view job' onClick='go(".$row["JobID"].")'/></td>";
				echo "<td>" . $row["JobTitle"] . "</td>";
				echo "<td>" . $row["JobListDate"] . "</td>";
				echo "<td>" . $row["CompanyName"] . "</td>";
				echo "<td>" . $row["JobFillStatus"] . "</td>";
			echo "</tr>";
		   }
	$conn->close();	
?> 
  </div>
</div>
</body>
</html>