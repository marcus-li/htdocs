 <!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Update Profile</title>
<script src="jquery-ui.min.js"></script>
<meta name="keywords" content="Update resume">
<link href="jquery-ui.css" rel="stylesheet"> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="jquery-ui.min.js"></script>
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
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
      <a class="HomePage" href="Update_Resume.php">Resume</a>
      <a class="HomePage" href="Update_Edu.php">Education background</a>
      <a class="HomePage">Work Experience</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>












<!-- BEGIN CONTENT -->
<div class = "content">




<h3 class = "contentHeader">Listed Job Experience:</h3><br><br>

<?php
//iterate through the current education in the user's profile and display it separated by horizontal rules
//education linked  to userid so match against $_SESSION['login_user']
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM priorjobs WHERE UserID = '".  $_SESSION['login_user'].
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
		
		
		
		
	
		
		  while($row = $result->fetch_assoc()) 
			{
			echo "<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitJobUpdate.php'>";
			echo "<table border='0'><tr>";
			//Company Name
			echo "<td>Company/Organization Name: </td>";
			echo '<td><input name="company" value = "'.$row["PJCompanyName"].'"> </input></td></tr>';
			
			//Position
			echo "<tr><td>Position: </td>";
			echo '<td><input name="position" value = "'.$row["PJJobTitle"].'"> </input></td></tr>';

			//Duties
			echo "<tr><td>Duties: </td>";
			echo '<td><textarea name="duties" value = "'.$row["PJDuties"].'">'.$row["PJDuties"].' </textarea></td></tr>';			
			
			//PJCity
			echo "<tr><td>City: </td>";
			echo '<td><input name="city" value = "'.$row["PJCity"].'"> </input></td></tr>';
			
			//PJState
			echo "<tr><td>State: </td>";
			echo '<td><input name="state" value = "'.$row["PJState"].'"> </input></td></tr>';
			
			//start date PJStartDate
			echo "<tr><td>Estimated Start Date: </td><td>";   
			echo '<input name = "start" class = "datepicker" value = "'.$row["PJStartDate"].'" readonly> </input></td></tr>';
			//end date PJEndDate
			echo "<tr><td>Estimated End Date: </td><td>";   
			echo '<input name = "end" class = "datepicker" value = "'.$row["PJEndDate"].'" readonly> </input></td></tr>';
			
			echo "<tr><td colspan='2' align='center'><br><input  type='submit' name = 'update' value = 'Update'></td></tr>";
			echo "<tr><td colspan='2' align='center'><input  type='submit' name = 'delete' value = 'Delete'></td></tr>";
			
			echo "<input name = 'id' type='hidden' value ='".$row["JobID"]."'></label>";
			echo "</table></form></div><br><hr><br>";		
			}
		}
		$conn->close();
	}
?>
<h3 class = "contentHeader">Add New Work Experience:</h3><br>
<!-- Add new work experience -->
			<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitJobUpdate.php'>
			<table border='0'>
			<tr>
			<td>Company/Organization: </td><td><input name="company"> </input></td>
			</tr><tr>
			<td>Position:</td> <td><input name = 'position'></td>
			</tr><tr>
			<td>Duties:</td><td> <textarea name = 'duties' > </textarea></td>
			</tr><tr>
			<td>City:</td> <td><input name = 'city'></td>
			</tr><tr>
			<td>State:</td> <td><input name = 'state'></td>
			</tr><tr>
			<td>Estimated Start Date: </td><td> <input name = "start" class = "datepicker" readonly> </input></td>
			</tr><tr>
			<td>Estimated End Date: </td><td> <input name = "end" class = "datepicker"  readonly> </input></td>
			</tr><tr>
			<td colspan='2' align='center'><br><input  type='submit' name = 'add' value = 'Submit Experience'></td></tr>
			</table></form></div><br><hr><br>	
</div>













</body>

<script language = "javascript">
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
</html>
