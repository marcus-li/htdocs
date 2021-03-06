
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
<title>Search</title>
<meta name="keywords" content="search">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="topbutton" href="profile/Update_Resume.php">Portfolio</a>
            <a class="topbutton" href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->





<div class="sidebar">
  <h1><img src="../MainPage_img/search.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button_select" href="Main_Page.php">Main Page</a>
      <a class="side_button" href = "search.php">Search</a>
      <a class="side_button_select" href="Manage_Application.php">Manage Applications</a>
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
			
			 echo "<table border='0' cellpadding='5' cellspacing='1'";
			 
			
		
			
			
			echo "<tr><td>Job Duties: </td><td>".$row["JobDuties"]."</td></tr>";
			
			echo "<tr><td>Expected Salary: </td><td>$".$row["JobJLowRange"]."-$".$row["JobHighRange"]."</td></tr>";
			
			echo "<tr><td>Required Years of Experience: </td><td>".$row["JobYRSExperience"]."</td></tr>";
			
			echo "<tr><td>Job Listed On: </td><td>".$row["JobListDate"]."</td></tr>";
			
		
			//company phone
			
			echo "<tr><td>Company Phone Number: </td><td>".$row["CompanyPhone"]."</td></tr>";
			
			//company fax
			echo "<tr><td>Company Fax: </td><td>".$row["CompanyFax"]."</td></tr>";
			
			//company website
			echo "<tr><td>Company Web Page: </td><td>".$row["CompanyHomePage"]."</td></tr>";
			
		
			//degree types
			echo "<tr><td>Accepted Degrees: </td><td>";
			$acceptedTypes = $conn->query("select distinct JobDegreeType from jDegreeTypes where jobid = ".$params['jobid']);
			//print each type
			$rows = mysqli_fetch_all($acceptedTypes,MYSQLI_NUM);
			$rows2 = null;
			foreach($rows as $dat) $rows2[] = $dat[0];	
				if(count($rows2))
			echo implode(", " , $rows2);
			echo "</td></tr>";
			
			
			
			//degree areas
			
				echo "<tr><td>Requested Majors: </td><td>";
			$acceptedTypes = $conn->query("select distinct JobDegreeArea from jDegreeareAs where jobid = ".$params['jobid']);
			//print each type
			$rows = mysqli_fetch_all($acceptedTypes,MYSQLI_NUM);
			$rows2 = null;
			foreach($rows as $dat) $rows2[] = $dat[0];	
			if(count($rows2))
			echo implode(", " , $rows2);
			echo "</td></tr>";
			
			
			//skills required
			
			
			
			echo "<tr><td>Preferred Skills: </td><td>";
			$acceptedTypes = $conn->query("SELECT skillName FROM jobskillrequirements, skills where skills.skillid = jobskillrequirements.skillid and jobid = ".$params['jobid']);
			//print each type
			$rows = mysqli_fetch_all($acceptedTypes,MYSQLI_NUM);
			$rows2 = null;
			foreach($rows as $dat) $rows2[] = $dat[0];	
			if(count($rows2))
			echo implode(", " , $rows2);
			echo "</td></tr>";
			
			
			
			
			
			//number of applicants
			$numApplicants = null;
			$numApplicants = $conn->query("select count(*) as 'a' from applies where job_jobid = ".$params['jobid']);
			
			echo "<tr><td>Number of Applicants: </td><td>".strval($numApplicants->fetch_assoc()['a']).$conn->error."</td></tr>";
			
			
			$filled = $row["JobFillStatus"];
			//fill status
			echo "<tr><td>Position Filled: </td><td>".$row["JobFillStatus"]."</td></tr>";
			
			echo "</table>";
			  
			
		if($filled =="No"){	
		
		
		$iApplied = null;
		$iApplied = $conn->query("select count(*) as 'a' from applies where job_jobid = ".$params['jobid']. " and seekerusername='".$_SESSION["login_user"]."'");
		if(!$iApplied)
		{
			echo $conn->error;
		}else{
		
			if($iApplied->fetch_assoc()['a']==1){
			
			echo "<br><br><b> Application Submitted.</b>";
			exit;
			
			}
		}
		
		
		
		
		
		
		
		
			
		//if the position is open and the user hasn't applied yet
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
	$.ajax({
    type : "POST",
    url : "apply.php",
	dataType:"text",
	data: {resumeid :document.getElementById("resumelist").value,
	jobid: jobID},		
	success:function(data){
		alert(data);
	}
		});
}
</script>

</html>
