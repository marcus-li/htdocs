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
<title>Seeker Information</title>
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
	
	//$var_value = $_SESSION['SeekerUserName'];
	
	$query = "Select * from user where UserName = '".$_SESSION['SeekerUserName']."'";
	 $conn = new mysqli($address, $username, $password, $database);
	 
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		$result = $conn->query($query);
		if($result->num_rows==0){
		echo "<h1>User Not Found</h1>";
		}else{
			$row = $result->fetch_assoc();
			//UserName
			echo "<h2> ".ucfirst($row["UserName"])." </h2>";
			//Email and Phone
			echo "<h3>".ucfirst($row["UserEmail"]).", " .ucfirst(strtolower($row["UserPhone"]))."</h3>";
			
			echo "<form method ='post' action=''>";
			
			 echo "<table border='0' cellpadding='5' cellspacing='1'";
		
			
			
			echo '<tr><td>First Name: </td><td> <input name = "UserFirstName" id="UserFirstName" value="'.$row["UserFirstName"].'" readonly></td></tr>';
			
			echo '<tr><td>Last Name: </td><td> <input name="UserLastName" id="UserLastName" value="'.$row["UserLastName"].'" readonly></td></tr>';
			
			echo '<tr><td>Street: </td><td> <input name="UserStreet1" id="UserStreet1" value="'.$row["UserStreet1"].'" readonly></td></tr>';
			
			echo '<tr><td>City: </td><td> <input name="UserCity" id="UserCity" value="'.$row["UserCity"].'" readonly></td></tr>';
			
			echo '<tr><td>State: </td><td> <input name="UserState" id="UserState" value="'.$row["UserState"].'" readonly></td></tr>';
			
			echo '<tr><td>State: </td><td> <input name="UserState" id="UserState" value="'.$row["UserState"].'" readonly></td></tr>';
			
			echo '<tr><td>Zip Code: </td><td> <input name="UserZip" id="UserZip" value="'.$row["UserZip"].'" readonly></td></tr>';
			
			echo '<tr><td>Cell Phone: </td><td> <input name="UserCell" id="UserCell" value="'.$row["UserCell"].'" readonly></td></tr>';
			
			echo "</table></form><br>";
		
		$conn->close();
    	}
	}
	?>
	
</div>
</div>

</body>
</html>