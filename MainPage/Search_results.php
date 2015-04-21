

 

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
         	<a class="HomePage" href="posterprofile/Update_Resume.php">Portfolio</a>
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
      <a class="HomePage" href="Main_Page.php">Main Page</a>
      <a class="HomePage">Search</a>
      <a class="HomePage" href="Manage_Application.php">Manage Applications</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->

</header>

<body>

<div class = "content"> 


<?php
	include '../dbscripts/credentials.php';
	
	
	$whereClause = "WHERE ";
	$hasWhere =false;
	if(($_POST["company"])!=''){
	$whereClause .= " CompanyName  LIKE '%". $_POST["company"]."%'";
	$hasWhere=true;
	}
	if(isset($_POST["salary"]))
	{
		if($hasWhere==true)
			{
				$whereClause .= " AND ";
			}
		$whereClause .= "JobHighRange >= " .$_POST["salary"];
			$hasWhere=true;
	}
	
	if($_POST["jobname"]!='')
	{
		if($hasWhere==true)
			{
				$whereClause .= " AND ";
			}
		$whereClause .= "JobTitle LIKE '%".$_POST["jobname"] ."%'";
			$hasWhere=true;
	}
	
		if($_POST["state"]!="Any")
	{
		if($hasWhere==true)
			{
				$whereClause .= " AND ";
			}
		$whereClause .= "JobState = '".$_POST["state"] ."'";
			$hasWhere=true;
	}
	
	
	
	
	$sql = "SELECT * FROM job ".$whereClause;
	
	
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
			echo "<tr><td>Job Title</td><td>Salary Range</td>
					<td>Company</td><td>State</td><td>City</td>";
			
			   while($row = $result->fetch_assoc()) 
			   {
			   
			   echo "<tr>";
					echo "<td>" . $row["JobTitle"] . "</td>";
					echo "<td>$" . $row["JobJLowRange"] ."-$".$row["JobHighRange"] . "</td>";
					echo "<td>" . $row["CompanyName"] . "</td>";
					echo "<td>" . $row["JobState"] . "</td>";
					echo "<td>" . $row["JobCity"] . "</td>";
				echo "</tr>";
			  
			   
			   }
			   
			   /*
			   
			   
			   $array[] = $row;
		
		
			$arr = json_decode(json_encode($array), true); //i prefer associative array in this context

			echo "<table>";
			foreach($array as $k=>$v)
				echo "<tr><td>$k</td><td>$v</td></tr>";
			echo "</table>";*/
		}
		//echo $sql;
		$conn->close();
    }
	
	
	
	
		
		
?> 
</div>

</body>

</html>
