<!doctype html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>	
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
<title>Previously Posted Job</title>
<meta name="keywords" content="search">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>	
<script language = "javascript">
function go(jobID){
	location.assign("viewJobSeeker.php?jobid="+jobID);
}
</script>
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
  <h1><img src="../../MainPage_img/search.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button" href="PostNewJob.php">Post New Job</a>
      <a class="side_button_select" href = "ReviewJobs.php">Review Previous Jobs</a>
      <a class="side_button" href = "Poster_Settings.php">Poster Settings</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->

</header>

<body>

<div class = "content" > 
<div style ="padding-top:80px; padding-left:80px;">

    <h2>Seekers</h2>
    
<?php
	include '../../dbscripts/credentials.php';
	parse_str($_SERVER['QUERY_STRING'], $params);
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
		exit;
    }
	$sql = "SELECT * FROM applies WHERE Job_JobID = '".$params['jobid']."'";
	
	
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
		echo "<tr><td></td><td>Application ID</td><td>Application Date</td>
				<td>Seeker Name</td><td>Job Status</td>";
		$jobslisted = null;
		   while($row = $result->fetch_assoc()) 
		   {

		   $jobslisted[' '.$row["Job_JobID"]] = 1;
		   
		   $_SESSION['SeekerUserName'] = $row["SeekerUserName"];

		   echo "<tr>";
				echo "<td><input type ='submit' value = 'view seeker' onClick='go(".$row["Job_JobID"].")'/></td>";
				echo "<td>" . $row["ApplicationID"] . "</td>";
				echo "<td>" . $row["ApplicationDate"] . "</td>";
				echo "<td>" . $row["SeekerUserName"] . "</td>";
				echo "<td>" . $row["Status"] . "</td>";
			echo "</tr>";
		   }
	$conn->close();	
?>
	
</div>
</div>

</body>
</html>