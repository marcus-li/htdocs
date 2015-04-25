
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
<title>Search</title>
<meta name="keywords" content="search">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="profile/Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->





<div class="sidebar">
  <h1>Job Search</h1>
  <div class="navbutton">
    <nav>
      <a class="side_button" href="Main_Page.php">Main Page</a>
      <a class="side_button_select">Search</a>
      <a class="side_button" href="Manage_Application.php">Manage Applications</a>
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
	$query = "Select * from job where jobid = ".$params['jobid'];
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
			
			 echo "<table border='0' cellpadding='1' cellspacing='1'";
			 
			
		
			
			
		/*	echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			echo "<tr><td>Job Listed: </td><td>".$row[""]."</td></tr>;";
			
			*/
			echo "</table>";
			  
			
			
			
			
			
		}
	 
	 
	 
	 }

?> 
</div>
</div>

</body>

<script language = "javascript">

function go(jobID){
	alert(jobID);
}
</script>

</html>
