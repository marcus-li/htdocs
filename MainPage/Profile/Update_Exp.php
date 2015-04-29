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
         	<a class="topbutton" href="../Main_Page.php">Main Page</a>
            <a class="topbutton" href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
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
      <a class="side_button" href="Update_Edu.php">Education background</a>
      <a class="side_button_select">Work Experience</a>
	  <a class="side_button" href="User_Settings.php">Profile Settings</a>
  
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
		"'  order by STR_TO_DATE(PJStartDate,'%m/%d/%Y') DESC ;";
	
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
			echo '<td><select name="state" > ';
			
		
		
			$states = array('AL'=>"Alabama",
							'AK'=>"Alaska",
							'AZ'=>"Arizona",
							'AR'=>"Arkansas",
							'CA'=>"California",
							'CO'=>"Colorado",
							'CT'=>"Connecticut",
							'DE'=>"Delaware",
							'DC'=>"District Of Columbia",
							'FL'=>"Florida",
							'GA'=>"Georgia",
							'HI'=>"Hawaii",
							'ID'=>"Idaho",
							'IL'=>"Illinois",
							'IN'=>"Indiana",
							'IA'=>"Iowa",
							'KS'=>"Kansas",
							'KY'=>"Kentucky",
							'LA'=>"Louisiana",
							'ME'=>"Maine",
							'MD'=>"Maryland",
							'MA'=>"Massachusetts",
							'MI'=>"Michigan",
							'MN'=>"Minnesota",
							'MS'=>"Mississippi",
							'MO'=>"Missouri",
							'MT'=>"Montana",
							'NE'=>"Nebraska",
							'NV'=>"Nevada",
							'NH'=>"New Hampshire",
							'NJ'=>"New Jersey",
							'NM'=>"New Mexico",
							'NY'=>"New York",
							'NC'=>"North Carolina",
							'ND'=>"North Dakota",
							'OH'=>"Ohio",
							'OK'=>"Oklahoma",
							'OR'=>"Oregon",
							'PA'=>"Pennsylvania",
							'RI'=>"Rhode Island",
							'SC'=>"South Carolina",
							'SD'=>"South Dakota",
							'TN'=>"Tennessee",
							'TX'=>"Texas",
							'UT'=>"Utah",
							'VT'=>"Vermont",
							'VA'=>"Virginia",
							'WA'=>"Washington",
							'WV'=>"West Virginia",
							'WI'=>"Wisconsin",
							'WY'=>"Wyoming");
		

      foreach($states as $key=>$value) { 
			if($row["PJState"]==$value){
			 echo  '<option value="'.$value.'" selected>'.$value .'</option>';
			}else{
			echo  '<option value="'.$value.'">'.$value .'</option>';
			}
        } 
  echo '  </select></td></tr>';
			
			
			
			
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
			<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitJobUpdate.php' onsubmit=" return check()">
			<table border='0'>
			<tr>
			<td>Company/Organization: </td><td><input id = "company" name="company"> </input></td>
			</tr><tr>
			<td>Position:</td> <td><input id = "position" name = 'position'></td>
			</tr><tr>
			<td>Duties:</td><td> <textarea name = 'duties' > </textarea></td>
			</tr><tr>
			<td>City:</td> <td><input name = 'city'></td>
			</tr><tr><td>State:</td><td>
			<?php
			function statesList() {
				$states = array('AL'=>"Alabama",
								'AK'=>"Alaska",
								'AZ'=>"Arizona",
								'AR'=>"Arkansas",
								'CA'=>"California",
								'CO'=>"Colorado",
								'CT'=>"Connecticut",
								'DE'=>"Delaware",
								'DC'=>"District Of Columbia",
								'FL'=>"Florida",
								'GA'=>"Georgia",
								'HI'=>"Hawaii",
								'ID'=>"Idaho",
								'IL'=>"Illinois",
								'IN'=>"Indiana",
								'IA'=>"Iowa",
								'KS'=>"Kansas",
								'KY'=>"Kentucky",
								'LA'=>"Louisiana",
								'ME'=>"Maine",
								'MD'=>"Maryland",
								'MA'=>"Massachusetts",
								'MI'=>"Michigan",
								'MN'=>"Minnesota",
								'MS'=>"Mississippi",
								'MO'=>"Missouri",
								'MT'=>"Montana",
								'NE'=>"Nebraska",
								'NV'=>"Nevada",
								'NH'=>"New Hampshire",
								'NJ'=>"New Jersey",
								'NM'=>"New Mexico",
								'NY'=>"New York",
								'NC'=>"North Carolina",
								'ND'=>"North Dakota",
								'OH'=>"Ohio",
								'OK'=>"Oklahoma",
								'OR'=>"Oregon",
								'PA'=>"Pennsylvania",
								'RI'=>"Rhode Island",
								'SC'=>"South Carolina",
								'SD'=>"South Dakota",
								'TN'=>"Tennessee",
								'TX'=>"Texas",
								'UT'=>"Utah",
								'VT'=>"Vermont",
								'VA'=>"Virginia",
								'WA'=>"Washington",
								'WV'=>"West Virginia",
								'WI'=>"Wisconsin",
								'WY'=>"Wyoming");
				return $states;
		}

		$states = statesList();
		?>
 <select name="state" >
        <?php foreach($states as $key=>$value) { ?>
            <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
        <?php } ?>
    </select></td>
			</tr><tr>
			<td>Estimated Start Date: </td><td> <input name = "start" id = "startDate" class = "datepicker" readonly> </input></td>
			</tr><tr>
			<td>Estimated End Date: </td><td> <input name = "end" class = "datepicker"  readonly> </input></td><td> (leave blank if current employee)</td>
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



function check(){

if(document.getElementById("company").value == ""){
	alert("please enter the company name");
	return false;
}


if(document.getElementById("position").value == ""){
	alert("please enter the position");
	return false;
}
if(document.getElementById("startDate").value == ""){
	alert("please enter the starting date for the position");
	return false;
}




return true;
}
</script>
</html>
