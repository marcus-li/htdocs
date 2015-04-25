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
<title>Update Profile</title>
<meta name="keywords" content="Update resume">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
<link href="jquery-ui.css" rel="stylesheet">
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
  <h1><img src="../../MainPage_img/Update Profile.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button" href="Update_Resume.php">Resume</a>
      <a class="side_button_select">Education background</a>
      <a class="side_button" href="Update_Exp.php">Work Experience</a>
	  <a class="side_button" href="User_Settings.php">Profile Settings</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>


<!-- BEGIN CONTENT -->
<div class = "content">




<h3 class = "contentHeader">Listed Education:</h3><br><br>

<?php
//iterate through the current education in the user's profile and display it separated by horizontal rules
//education linked  to userid so match against $_SESSION['login_user']
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM education WHERE UserID = '".  $_SESSION['login_user'].
		"' ;";
	
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
		
		
		  while($row = $result->fetch_assoc()) 
			{
			//create a div with the ID of the data set to retrieve modified row
			echo "<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitEduUpdate.php'>";
			echo "<table border='0'><tr>";
			//University
			echo "<td>School/University: </td>";
			
			echo '<td><input name="edu" value = "'.$row["EducationUniversity"].'"> </input></td></tr>';
			
			//degree type
			echo "<tr>";
			echo "<td>Degree Type:</td> <td><select name = 'degType'>";
				foreach($degreeTypes as $type){
				echo "<option value='".$type."' ";
					if($type == $row["EducationDegreeType"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			
			//degree area
			echo "<tr>";
			echo "<td>Degree Area:</td><td> <select name = 'degArea'>";
			foreach($degreeAreas as $type){
				echo "<option value='".$type."' ";
					if($type == $row["EducationDegreeArea"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			
			
			
			//GPA
			echo "<tr>";
			echo "<td>GPA: </td><td>";   
			echo '<input  name = "gpa" value = "'.$row["EducationGPA"].'"> </input></td></tr>';
			
			
			//start date
			echo "<tr><td>Start Date: </td><td>";   
			echo '<input name = "start" class = "datepicker" value = "'.$row["EducationStartDate"].'" readonly> </input></td></tr>';
			//Graduation Date
			echo "<tr><td>Graduation Date: </td><td>";   
			echo '<input name = "grad" class = "datepicker" value = "'.$row["EducationGradDate"].'" readonly> </input></td></tr>';
			
			echo "<tr><td colspan='2' align='center'><br><input  type='submit' name = 'update' value = 'Update'></td></tr>";
			echo "<tr><td colspan='2' align='center'><input  type='submit' name = 'delete' value = 'Delete'></td></tr>";
			
			echo "<input name = 'id' type='hidden' value ='".$row["EduID"]."'></label>";
			echo "</table></form></div><br><hr><br>";		
			}
		}
		$conn->close();
	}
?>
<h3 class = "contentHeader">Add new Education:</h3><br>

<!-- add new education-->


			<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitEduUpdate.php'>
			<table border='0'><tr>
			<td>School/University: </td><td><input name="edu"> </input></td></tr>
			<tr>
			<td>Degree Type:</td> <td><select name = 'degType'>
			<?php
				foreach($degreeTypes as $type){
				echo "<option value='".$type."' ";
					if($type == $row["EducationDegreeType"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			
			//degree area
			echo "<tr>";
			echo "<td>Degree Area:</td><td> <select name = 'degArea'>";
			foreach($degreeAreas as $type){
				echo "<option value='".$type."' ";
					if($type == $row["EducationDegreeArea"]) echo " selected";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			?>
			
			<tr><td>GPA:</td><td> <input  name = "gpa" > </input></td></tr>
			<tr><td>Start Date: </td><td>   
			<input name = "start" class = "datepicker" readonly> </input></td></tr>
			<tr><td>Graduation Date: </td><td> 
			<input name = "grad" class = "datepicker"  readonly> </input></td></tr>
			<tr><td colspan='2' align='center'><br><input  type='submit' name = 'add' value = 'Add'></td></tr>
			</table></form></div><br><hr><br>	
</div>

</body>
</html>

<script>
//date picker to choose start date and end dates
$( ".datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true
    });


// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);
</script>

<script language="javascript">
function sendMultiQuery(queryPlaceholderID){
//retrieve the sql hidden in the element given the id passed in by the parameter
var sql = document.getElementByID(queryPlaceholderID).value;
 $.ajax({
    type : "POST",
    url : "dbUpdateSQL.php",
	data: {sql :sql},		
	success:function(){
		alert("submitted changes");
	}
		});

}

</script>