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
    <nav>
         	<a class="HomePage" href="../Main_Page.php">Main Page</a>
             <a href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1>Update Profile</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage">Resume</a>
      <a class="HomePage" href="Update_Edu.php">Education background</a>
      <a class="HomePage" href="Update_Exp.php">Work Experience</a>
	  <a class="HomePage" href="User_Settings.php">Profile Settings</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>
<!----page content -->

<div class="content" ><br><br>
<br><br>
<div style = "padding-left: 80px">
Upload or modify a resume submission:<br>
<form method="post" action="<?php $_PHP_SELF ?>" name="send">
	<?php
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM resume WHERE SeekerId = '".  $_SESSION['login_user'].
		"'";
	
	$result = NULL;
  
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		if (!$result) {
		    echo "<b>database result error</b>";
			exit;
		} else {
		
		  $array = array();	
		  //build a dropdown menu of resumes for the user to use
		  ?>
		  <select name="ResumeList" >
			<option selected="selected" value = -1>New Resume</option>
		  
		  <?php
		  while($row = $result->fetch_assoc()) 
			{
			//add row to select box
			 echo '<option title = "caption" value="'. $row["ResumeID"] . '">['. $row["ResumeFileName"].'] '.$row["Added"].'  </option>';
			   
			}
		  ?></select>
		  <?php
		}
		$conn->close();
    }?>
	
	<!--button to select new resume-->
	<input class="button" type="submit" value="Go" name="submitBtn" id="button" ><br><br></div><hr>
	
	</form>
	
	
	<?php
	//After resume selected and confirmed:
	if(isset($_POST["ResumeList"]))
	{
		include '../../dbscripts/credentials.php';
		//Retrieve all the resume details and populate already selected fields
		$conn = new mysqli($address, $username, $password, $database);
			displaySelectedResume($conn);
			displayRelevantSkills($conn);
			$conn->close();
	}
	?>
		
</div>
</body>
</html>

<input type="hidden" name="hiddenSQL" value="select* from resume">

<?php
//build a table for the selected resume at the calling location
function displaySelectedResume($conn){
	$sql = "SELECT * FROM resume WHERE resume.resumeid = '".$_POST["ResumeList"]."';";
		// Check connection	
		$result = NULL;
		 if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} else {
			$result = $conn->query($sql);
			if (!$result) {
				echo "<b>database result error</b>";
				exit;
			} else {
			
			  $array = array();	
			  
				
				   $row = $result->fetch_assoc();

					echo "<h3> <u>Resume Details</u></h3><div style = 'padding-left:80px'>";
					
					echo "<table>";
					echo "<tr>";
					//row - objective
					echo "<td>Objective: </td><td><textarea id='objective' onchange=\"setChanged('objective')\">" . $row["ResumeObjective"] ."</textarea></td>";
					echo "</tr><tr>";
					// row - salary requirements
					echo "<td> Minimum salary (USD):</td><td> <input type = 'text' id='salary' onChange=\"setChanged('salary')\"  onKeyUp=\"setChanged('salary')\" value = \"" . $row["ResumeSalaryMin"] ."\"></input></td>";
					echo "</tr><tr>";
					//row - resume file name
					echo "<td> Resume: " . $row["ResumeFileName"] . "</td>";
					echo "<td><form method='post' action = 'uploadResume.php' style = 'margin:15px; padding 10px;' enctype='multipart/form-data' target='_blank'>
					<input type='file' name='file1' id='file1' style='border:none;' accept='.pdf'/> ";
					//if there is already a file make submit say replace otherwise add
					if($row["ResumeFileName"]=="No File" ||$row["ResumeFileName"]==""){
					echo " Upload Resume (PDF format)</form></td>";
					}else{
					echo "<label > *Selecting a file will replace your previously uploaded resume '".$row["ResumeFileName"]."'</label>
					</form></td>";
					}
					
				   
				   echo "</tr></table></div><br><hr>";
				 //save resumeID  
				   echo '<input type="hidden" name="hiddenResumeID" value="'.$row["ResumeID"].'">';
				    
				}
			
			}
}


//-------------------






//------------------------------




//Show skills
function displayRelevantSkills($conn){
	//use a left join query to show all skills 
	//we can determine if skill is used if the skillid is set or not
	$sql = 
"select A.skillid AS listedskillid, Skills.skillName ,Skills.skillID as skillid from skills LEFT JOIN 
( SELECT SkillID FROM
resumelistedskills 
where resumelistedskills.ResumeID = '".$_POST["ResumeList"]."'
) AS A
ON A.SkillID=skills.skillid";

	
		// Check connection	
		$result = NULL;
		 if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} else {
			$result = $conn->query($sql);
			if (!$result) {
				echo "<b>database result error</b>";
				exit;
			} else {
			//arrays used to build lists see below
			  $selected   = array();	
			  $unselected = array();
				   while($row = $result->fetch_assoc()) 
				   {
				   if(isset($row["listedskillid"])){
				   //this resume has this skill listed already
				   $selected[$row["skillid"]] = $row["skillName"] ;
						}else{
						//this resume doesnt have this skill listed
					$unselected[$row["skillid"]] = $row["skillName"] ;
						}
				   }
				}
			}

			
		
			
//Relevant Skills
	
	echo ' <h3><u>Relevant Skills </u></h3><div style = "padding-left:80px"><form  method="POST" name="theForm">
	<table bgcolor="white" border="0" cellpadding="5" cellspacing="2">
	<tr> <td align="center"> <b>Available Skills</b><br>
    <select style="width:180px;" name=menu1 size=10 multiple>';
	//add each option
	foreach ($unselected as $key => $value) {
			 echo '<option value = "'.$key.'">'.$value.'</option>';
			}  
	   
    echo '</select><br />
    <p align="center"><input type="button" onClick="one2two()" value=" Add Skills "></p>

	</td><td align="center">
	<b> My Skills </b> <br>
    <select style="width:180px;" name=menu2 size=10 multiple >';
	foreach ($selected as $key => $value) {
			 echo '<option value = "'.$key.'">'.$value.'</option>';
			}
    
	
	echo' </select><br />
    <p align="center"><input type="button" onClick="two2one()" value=" Remove Skills " ></p>
	</td></tr></table></div>';

	if( $_POST["ResumeList"] ==-1){
	echo '<div align="center"><input type="button" align="center" onClick="sendNewResume()" value=" Confirm Resume Addition " ></div><br><br><br><br><br><br><br>
	</form>';
	}
	else{
	echo '<div align="center"><input type="button" onClick="sendOptions()" value=" Submit Updates " ><input type="button" onClick="deleteResume()" value=" Delete Resume " ></div><br><br><br><br><br><br><br>
	</form>';			
			}
	
			
			
}


?>




<script language= "JavaScript" >

var changed =false;
var objectiveChanged =false;
var salaryChanged = false;

//notify that update queries should be constructed on submitUpdates
function setChanged(element){
	if(element=="objective"){
		objectiveChanged = true;
	}else if(element == "salary"){
		salaryChanged =true;
	}
}
	//scripts to move the selections from one box to the next and back	

			function one2two() {
			changed=true;
			var m1 = document.theForm.menu1;
				var m2 = document.theForm.menu2;
				m1len = m1.length ;
				for ( i=0; i<m1len ; i++){
					if (m1.options[i].selected == true ) {
						m2len = m2.length;
						m2.options[m2len]= new Option(m1.options[i].text, m1.options[i].value);
					}
				}

				for ( i = (m1len -1); i>=0; i--){
					if (m1.options[i].selected == true ) {
						m1.options[i] = null;
					}
				}
			}

			function two2one() {
			changed =true;
			var m1 = document.theForm.menu1;
			var m2 = document.theForm.menu2;
				m2len = m2.length ;
					for ( i=0; i<m2len ; i++){
						if (m2.options[i].selected == true ) {
							m1len = m1.length;
							m1.options[m1len]= new Option(m2.options[i].text, m2.options[i].value);
						}
					}
					for ( i=(m2len-1); i>=0; i--) {
						if (m2.options[i].selected == true ) {
							m2.options[i] = null;
						}
					}
			}		
			
			
				

function sendUpdateColumn(updatedValueElement, columnName){
var values = document.getElementById(updatedValueElement).value;
var resumeID = document.getElementsByName("hiddenResumeID")[0].value; 

var sql = "UPDATE resume SET "+columnName+"='"+values+"' WHERE resumeID = '"+resumeID+"';";
 
 $.ajax({
    type : "POST",
    url : "dbUpdateSql.php",
	data: {sql :sql},
		});

}
/*			//currently not used, send a multi query

function sendMultiQuery(queryPlaceholderID){
var resumeID = document.getElementsByName("hiddenResumeID")[0].value;
var sql = document.getElementsByName(queryPlaceholderID)[0].value;
 $.ajax({
    type : "POST",
    url : "dbUpdateSQL.php",
	data: {sql :sql},		
	success:function(){
		alert("submitted changes");
	}
		});

}*/

//sent when resume is updated
function sendOptions() {
		if(objectiveChanged){
	sendUpdateColumn('objective','ResumeObjective');
	}
  if(salaryChanged){
	sendUpdateColumn('salary','ResumeSalaryMin');
  }	
  
  sendUpdateResumeFile();
  
			var m2 = document.theForm.menu2;
			var resumeID = document.getElementsByName("hiddenResumeID")[0].value;
			var sql = " DELETE from resumelistedskills where resumeID = " + resumeID + ";";
			
				m2len = m2.length ;
					for ( i=0; i<m2len ; i++){
					var skillId = m2.options[i].value;

					sql += "INSERT IGNORE INTO resumelistedskills (ResumeID, SkillID) VALUES ("+resumeID+", "+skillId+");";
					}
				 
	
  
  if(changed){
  $.ajax({
    type : "POST",
    url : "dbUpdateSql.php",
	data: {sql :sql},		
		});

	}
		if (window.confirm('Resume Updated')) {
        window.location.href='Update_resume.php';
    }
	
}



function deleteResume(){
if (!window.confirm('Confirm Deletion of Resume')) {
        return;
    }
	var resumeID = document.getElementsByName("hiddenResumeID")[0].value;

	$.ajax({
			type : "POST",
			url : "deleteResume.php",
			data: {resumeID :resumeID}	
			}
		).done(function(){
			alert('deleted');
			window.location.href='Update_resume.php';
		}); 

       
}


//sent when new resume added
function sendNewResume() {	

	//create a new resume entry go to updateNewResume to fill in
	  $.ajax({
			type : "POST",
			url : "dbAddResumeGetID.php",	
			success: updateNewResume
		});  
}


//update resume file
//resume id has been created and is store in hidden form variable 
function sendUpdateResumeFile(){
 var resumeID = document.getElementsByName("hiddenResumeID")[0].value;
 var formData = new FormData(); 
 
 var file = document.getElementById("file1").files[0];
 if(!file) return;
if(file.size>1048576){
  alert("file too large " + file.size);
  return;
 }
 
 formData.append("file", file);
 formData.append("resumeID", resumeID);

	$.ajax({
			type : "POST",
			url : "uploadResume.php",
			data: formData,	
			contentType: false,
			processData: false,
		});  


}



function updateNewResume(data){
//set the resume id and reuse regular update functions
document.getElementsByName("hiddenResumeID")[0].value = data;
	var resumeID = data; 
	

	sendUpdateColumn('objective','ResumeObjective');
	sendUpdateColumn('salary','ResumeSalaryMin');
	sendUpdateResumeFile();
 
 
 
  
			var m2 = document.theForm.menu2;
			
			var resumeID = document.getElementsByName("hiddenResumeID")[0].value;
			var sql = " DELETE from resumelistedskills where resumeID = " + resumeID + ";";
			
				m2len = m2.length ;
					for ( i=0; i<m2len ; i++){
					var skillId = m2.options[i].value;

					sql += "INSERT IGNORE INTO resumelistedskills (ResumeID, SkillID) VALUES ("+resumeID+", "+skillId+");";
					}
				 
	
  
  if(changed){
  $.ajax({
    type : "POST",
    url : "dbUpdateSql.php",
	data: {sql :sql},		
		});

	}
	if (window.confirm('Resume Added')) {
        window.location.href='Update_resume.php';
    }
	

}


</script>			
			
			