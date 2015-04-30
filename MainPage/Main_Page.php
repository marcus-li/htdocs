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
<title>MainPage</title>
<meta name="keywords" content="main page, basic">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
  <div class="topbar">
    <div class="navbutton">
      <nav> <a>Welcome!</a> 
      <a class="topbutton" href="Profile/PostNewJob.php">Poster</a> 
      <a class="topbutton" href="Profile/Update_Resume.php">Portfolio</a> <a class="topbutton" href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a> </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- topbar -->
  
  <div class="sidebar">
    <h1><img src="../MainPage_img/Uconn's Job Search.png"></h1>
    <div class="navbutton">
      <nav> 
      <a class="side_button_select" >Main Page</a> 
      <a class="side_button" href="Search.php">Search</a> 
      <a class="side_button" href="Manage_Application.php">Manage Applications</a> 
      </nav>
    </div>
    <!-- navbutton --> 
  </div>
  <!-- sidebar --> 
</header>
<div class = "content" >
  <div style ="padding-top:80px; padding-left:80px;">
    <h2>Unfilled Jobs you may interested in</h2>
    
<?php
	include '../dbscripts/credentials.php';
	$sql = "SELECT * FROM applies ";
	$result = NULL;
    
	
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		if (!$result) {
		    throw new Exception("Database Error [{$this->database->errno}] {$this->database->error}");
		} else {
		
		  $array = array();	
		  
		  echo "<table border='2' cellpadding='2' cellspacing='2'";
			echo "<tr><td></td><td>Job Title</td><td>Salary Range</td>
					<td>Company</td><td>State</td><td>City</td>";
			
			   while($row = $result->fetch_assoc()) 
			   {
			   
			   echo "<tr>";
					echo "<td><input type ='submit' value = 'view job' onClick='go(".$row["JobID"].")'/></td>";
					echo "<td>" . $row["JobTitle"] . "</td>";
					echo "<td>$" . $row["JobJLowRange"] ."-$".$row["JobHighRange"] . "</td>";
					echo "<td>" . $row["CompanyName"] . "</td>";
					echo "<td>" . $row["JobState"] . "</td>";
					echo "<td>" . $row["JobCity"] . "</td>";
				echo "</tr>";
				
				
			  
			   
			   }
			   

		}
		$conn->close();
    }
	
	
	
	
		
		
?> 
  </div>
</div>
</body>
</html>
