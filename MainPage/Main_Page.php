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
<title>MainPage</title>
<meta name="keywords" content="main page, basic">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>	
<script language = "javascript">
function go(jobID){
	location.assign("viewJob.php?jobid="+jobID);
}
</script>
<body>
<header>
  <div class="topbar">
    <div class="navbutton">
      <nav> <a>Welcome!</a> 
      <a class="topbutton" href="Profile/PostNewJob.php">Poster</a> 
      <a class="topbutton" href="Profile/Update_Resume.php">Portfolio</a> <a class="topbutton" href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a> </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- topbar -->
  
  <div class="sidebar">
    <h1><img src="../MainPage_img/Uconn's Job Search.png"></h1>
    <div class="navbutton">
      <nav> 
      <a class="side_button_select" >Main Page</a> 
      <a class="side_button" href="Search.php">Search</a> 
      <a class="side_button" href="Manage_Application.php">Manage Applications</a> 
      </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- sidebar --> 
</header>
<div class = "content" >
  <div style ="padding-top:80px; padding-left:80px;padding-right:30px;overflow:auto">
    <h2>Unfilled Jobs you may interested in</h2>
    
<?php
	include '../dbscripts/credentials.php';
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
		exit;
    }
	$sql = "select * from job,
	(select jdegreeareas.JobID from jdegreeareas, jdegreetypes where 
	jdegreeareas.JobDegreeArea in (select educationdegreearea from seeker, education where seeker.UserName = education.UserId and seeker.username = '".$_SESSION["login_user"]."')
	and jdegreetypes.jobdegreetype in (select educationdegreetype from seeker, education where seeker.UserName = education.UserId and seeker.username = '".$_SESSION["login_user"]."')
	and jdegreeareas.jobid = jdegreetypes.jobid) as edumatches
	where job.jobid= edumatches.jobid and job.JobFillStatus = 'No'
	and job.jobid not in (
		select applies.Job_JobID from applies where applies.SeekerUserName = '".$_SESSION["login_user"]."'
	)
	limit 10";
	
	
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
		echo "<tr><td></td><td>Job Title</td><td>Salary Range</td>
				<td>Company</td><td>State</td><td>City</td>";
		
		   while($row = $result->fetch_assoc()) 
		   {
		   
		   echo "<tr>";
				echo "<td><input type ='submit' value = 'view job' onClick='go(".$row["JobID"].")'/></td>";
				echo "<td>" . $row["JobTitle"] . "</td>";
				echo "<td>$" . $row["JobJLowRange"] ."-$".$row["JobHighRange"] . "</td>";
				echo "<td>" . $row["CompanyName"] . "</td>";
				echo "<td>" . $row["JobState"] . "</td>";
				echo "<td>" . $row["JobCity"] . "</td>";
			echo "</tr>";
		   
		   }
		 //build table from skills in case few rows populated by degree requirements 
		   if($secondQueryLimit !=0)
		   {
		   $row = null;
		   $result = null;
		   $sql = "select * from job,
			(select job.jobid from job,jobskillrequirements
			where jobskillrequirements.SkillID in
			 (select distinct skillid from resumelistedskills,resume,user where user.username = '".$_SESSION["login_user"]."' and resume.ResumeID=resumelistedskills.ResumeID)
			 and job.JobID = jobskillrequirements.JobID) as edumatches
			where job.jobid= edumatches.jobid and job.JobFillStatus = 'No'
			and job.jobid not in (
				select applies.Job_JobID from applies where applies.SeekerUserName = '".$_SESSION["login_user"]."'
			)
			limit ".$secondQueryLimit;
			
			$result = $conn->query($sql);
			if (!$result) {
				exit;
			}
		   
		   while($row = $result->fetch_assoc()) 
		   {
		   
		   echo "<tr>";
				echo "<td><input type ='submit' value = 'view job' onClick='go(".$row["JobID"].")'/></td>";
				echo "<td>" . $row["JobTitle"] . "</td>";
				echo "<td>$" . $row["JobJLowRange"] ."-$".$row["JobHighRange"] . "</td>";
				echo "<td>" . $row["CompanyName"] . "</td>";
				echo "<td>" . $row["JobState"] . "</td>";
				echo "<td>" . $row["JobCity"] . "</td>";
			echo "</tr>";
		   
		   }
		 }
		echo "</table>";
	
	//echo $sql;
	$conn->close();
    
	
	
?> 
  </div>
</div>
</body>
</html>
