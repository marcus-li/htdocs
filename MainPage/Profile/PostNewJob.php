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
         	<a class="topbutton" href="../Main_Page.php">Seeker</a>
             <a class="topbutton" href = "../../login/logout.php">Log out of [<b><?php 
	echo "". $_SESSION['login_user'];
	?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1><img src="../../MainPage_img/PostNewJob.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button_select">Post New Job</a>
      <a class="side_button" href="ReviewJobs.php">Review Previous Jobs</a>
      <a class="side_button" href="Poster_Settings.php">Profile Settings</a>
  
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

	$sql = "SELECT * FROM company WHERE CompanyId = '01'";
	
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
		}else{
			$degreeAreas = array(
		"Aerospace Engineering",
		"Applied Physiology"
		,"ArchitectureBuilding Construction",
		"Art",
		"ArtsEconomics History",
		"Biology",
		"Biomedical Engineering",
		"Biomolecular Engineering",
		"Business",
		"Chemical Engineering",
		"ChemistryBiochemistry",
		"City and Regional Planning",
		"Civil Engineering",
		"Communication",
		"Computer Engineering",
		"Computer Science",
		"Earth and Atmospheric Sciences",
		"Electrical Engineering",
		"Industrial and Systems Engineering",
		"Industrial Design",
		"International Affairs",
		"Literature",
		"Materials Science and Engineering",
		"Mathematics",
		"Mechanical Engineering",
		"Modern Languages",
		"Music",
		"Physics",
		"Psychology",
		"Public Policy",
		"Textile Engineering"
		);
		
		$degreeTypes = array(
		"High School or Equivalent",
		"Associate Degree",
		"Bachelors Degree",
		"Masters Degree",
		"Doctorate"
		);
			
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


<h3 class = "contentHeader">1. Post a new Job:</h3>
<div style='padding-left:50px; padding-right:100px;'>

<!-- Post a new job -->

<form method ='post' action='insertNewJob.php'>

			<table border='0'><tr>
            
			<td>JobId: </td><td><input name="JobId" id="JobId" hidden/></td></tr>
			<td>Job List Date:</td> <td><input name = 'JobListDate' id="JobListDate" hidden/></td></tr>		
			<tr><td>Company Name: </td><td> <input  name = "CompanyName" id="CompanyName" value="<?php echo $info["CompanyName"];?>" readonly/></td></tr>
			<tr><td>Job Title: </td><td> <input  name = "JobTitle" id="JobTitle"/></td></tr>
			<tr><td>Job City: </td><td> <input  name = "JobCity" id="JobCity" value="<?php echo $info["CompanyCity"];?>"/></td></tr>
            <tr><td>Job State: </td><td> <input  name = "JobState" id="JobState"/></td></tr>
            <tr><td>Job Zip: </td><td> <input  name = "JobZip" id="JobZip"/></td></tr>
            <tr><td>Job Duties: </td><td> <textarea  name = "JobDuties" id="JobDuties"></textarea></td></tr>
            <tr><td>Job Description: </td><td> <textarea  name = "jobDescription" id="JobDescription"></textarea></td></tr>
            <tr><td>Years of Experience: </td><td> <input  name = "JobYRSExperience" id="JobYRSExperience"/></td></tr>
            <tr><td>Degree Type:</td> <td><select multiple class="select" name = "JobDegreeType">
			<?php
				foreach($degreeTypes as $type){
				echo "<option value='".$type."' ";
					//if($type == $row["JobDegreeType"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			?>
			
            <tr><td>Degree Area:</td> <td><select multiple class="select" name = "JobDegreeArea">
            <?php
				foreach($degreeAreas as $type){
				echo "<option value='".$type."' ";
					//if($type == $row["JobDegreeArea"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			?>
            
            <tr><td>Job Low Range: </td><td> <input  name = "JobJLowRange" id="JobJLowRange"/></td></tr>
            <tr><td>Job High Range: </td><td> <input  name = "JobHighRange" id="JobHighRange"/></td></tr>
            <tr><td>Job Fill Status: </td><td> <select  name = "JobFillStatus" id="JobFillStatus"><option value=" "></option>
            	<option value="No" selected>No</option>
                <option value="Yes">Yes</option>
            </select></td></tr>
                        
            <!-- The user must be a poster in order to succeed -->
            <input name="PosterUserName" id="PosterUserName" value="<?php echo $_SESSION['login_user'];?>" hidden/>
            
            <tr><td colspan='2' align='center'><br><input  type='submit' name = 'post' value = 'Post'></td></tr>
            
</table></form></div><br><hr><br>	
            
            
 <?php
	$conn->close();
?>
 
</div>
</body>
</html>

<script>
(function(){
    var selected={};
    $('select').click(function(e){
        var $this=$(this),options=this.options,option,value,n;
        value=$this.val();
        for(n=0; n<options.length; ++n){
            option=options[n];
            if(option.value==value) selected[value]= !selected[value];
            option.selected= !!selected[option.value];
        }
        return false;
    });
})();
</script>




