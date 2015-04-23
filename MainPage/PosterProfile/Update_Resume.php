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

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>
<!----page content -->

<div class="content" ><br><br>
TODO: expected behavior for this page:<br><br>
Display user's resumes and resume files, giving them the option of modifying their files if needed.
<form method="post" action="<?php $_PHP_SELF ?>" name="send">
	<?php
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM resume,seeker WHERE seeker.username = '".  $_SESSION['login_user'].
		"' AND resume.resumeID=seeker.resumeID";
	
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
			<option selected="selected">Choose Resume</option>
		  
		  <?php
		  while($row = $result->fetch_assoc()) 
			{
			 echo '<option title = "caption" value="'. $row["ResumeID"] . '">['. $row["ResumeID"].'] '.$row["Added"].'  </option>';
			   
			}
		  ?></select>
		  <?php
		}
		$conn->close();
    }?>
	
	
	<input class="button" type="submit" value="Show" name="submitBtn" id="button" ><br><br><hr>
	
	</form>
	
	
	<?php
	//executes if there is a resume selected
	if(isset($_POST["ResumeList"]))
	{
		if($_POST["ResumeList"]=="Choose Resume") exit;

		include '../../dbscripts/credentials.php';
		
		// Create connection
		$conn = new mysqli($address, $username, $password, $database);
			displaySelectedResume($conn);
			
	
			displayAddedSkills2($conn);
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

						echo "<div ><h3 align = 'center'> Resume Details</h3>";
						echo "<label style=\"vertical-align:top; text-align:right; padding-left:76px;\">Objective: </label><textarea id='objective' onchange=\"setChanged('objective')\">" . $row["ResumeObjective"] . "</textarea><br>";
						echo "<label style='padding-left:30px;'> Minimum salary (USD): <input type = 'text' id='salary' onChange=\"setChanged('salary')\"  onKeyUp=\"setChanged('salary')\" value = \"" . $row["ResumeSalaryMin"] ."\"></input></label> <br>";
						echo "<td>" . $row["ResumeFileName"] . "</td>";
						echo "<td>" . $row["ResumeLastName"] . "</td>";
					
				   
				   echo "</div><br><hr>";
				 //save resumeID  
				   echo '<input type="hidden" name="hiddenResumeID" value="'.$row["ResumeID"].'">';
				    
				}
			
			}
}


//-------------------






//------------------------------




//Show skills with checkboxes
function displayAddedSkills2($conn){
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
			
			  $selected = array();	
			  $unselected = array();
				
				   while($row = $result->fetch_assoc()) 
				   {
				   if(isset($row["listedskillid"])){
				   $selected[$row["skillid"]] = $row["skillName"] ;
						}else{
				$unselected[$row["skillid"]] = $row["skillName"] ;
						}
				   }
				}
			
			}

			
		
			
//formatting
	
	echo ' <h3 align = "center">Relevant Skills </h3><form  method="POST" name="theForm">
<table bgcolor="white" border="0" cellpadding="5" cellspacing="2" align="center">
<tr> <td align="center"> <b>Available Skills</b><br>
    <select style="width:180px;" name=menu1 size=10 multiple>';
	
	foreach ($unselected as $key => $value) {
			 echo '<<option value = "'.$key.'">'.$value.'</option>';
			}

	//add options here
       
 
	   
	   
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
	</td></tr></table>
	<input type="button" align="center" onClick="sendOptions()" value=" Submit Updates " >
	</form>';			
			
	
			
			
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
			//currently not used, send a multi query

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

}

//sent when skills have been updated
function sendOptions() {
		if(objectiveChanged){
	sendUpdateColumn('objective','ResumeObjective');
	
	}
  
  if(salaryChanged){
	sendUpdateColumn('salary','ResumeSalaryMin');
  }	
  
  
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
	
	alert('Updated');
}
</script>			
			
			