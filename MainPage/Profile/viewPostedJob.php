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
	location.assign("viewSeekersApplied.php?jobid="+jobID);
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

<?php
	include '../../dbscripts/credentials.php';
	parse_str($_SERVER['QUERY_STRING'], $params);
	//echo $params['jobid'];
	$query = "Select * from job,company where company.companyname = job.CompanyName and jobid = ".$params['jobid'];
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
			
			echo "<form method ='post' action=''>";
			
			 echo "<table border='0' cellpadding='5' cellspacing='1'";
		
			
			
			echo '<tr><td>Job Duties: </td><td> <input name = "JobDuties" id="JobDuites" value="'.$row["JobDuties"].'"></td></tr>';
			
			echo '<tr><td>Range Salary: </td><td> <input name="JobJLowRange" id="JobJLowRange" value="' .$row["JobJLowRange"].'"> $min <input name="JobHighRange" id="JobHighRange" value="'.$row["JobHighRange"].'"> $high</td></tr>';
			
			echo '<tr><td>Required Years of Experience: </td><td> <input name="JobYRSExperience" id="JobYRSExperience" value="'.$row["JobYRSExperience"].'"></td></tr>';
			
			echo '<tr><td>Job Listed On: </td><td> <input name="JobListDate" id="JobListDate" value="'.$row["JobListDate"].'" readonly></td></tr>';
			
			echo '<tr><td>Job Fill Status: </td><td> <input name="JobFillStatus" id="JobFillStatus" value="'.$row["JobFillStatus"].'"></td></tr>';
			
			$filled = $row["JobFillStatus"];
			
		
			//company phone
			
			echo "<tr><td>Company Phone Number: </td><td>".$row["CompanyPhone"]."</td></tr>";
			
			//company fax
			echo "<tr><td>Company Fax: </td><td>".$row["CompanyFax"]."</td></tr>";
			
			//company website
			echo "<tr><td>Company Web Page: </td><td>".$row["CompanyHomePage"]."</td></tr>";
			
			//number of applicants
			$numApplicants = null;
			$numApplicants = $conn->query("select count(*) as 'a' from applies where job_jobid = ".$params['jobid']);
			
			echo "<tr><td>Number of Applicants: </td><td>".strval($numApplicants->fetch_assoc()['a']).$conn->error."</td></tr>";
			
			echo "</table></form><br>";
			  
		  ?>
		  <?php
		  
		  echo "<br><tr><td colspan='2' align='center'><input type='submit' value='Find Seekers' onclick='go(".$params['jobid'].")'></td></tr>";
		
		$conn->close();
    	}
	}
	?>
	
</div>
</div>

</body>
</html>
