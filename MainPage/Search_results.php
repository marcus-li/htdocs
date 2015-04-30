

 

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
         	<a class="topbutton" href="profile/Update_Resume.php">Portfolio</a>
            <a class="topbutton" href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->





<div class="sidebar">
  <h1><img src="../MainPage_img/search.png"></h1>
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
<div style ="padding-top:80px; padding-left:80px;padding-right:20px;overflow:auto;">

<?php
	include '../dbscripts/credentials.php';
	
	
	$whereClause = "WHERE ";
	$hasWhere =false;
	
	if(trim($_POST["company"])!=''){
	$companies = explode(';', $_POST["company"]);
		if(count($companies)>1){
			//build parenthesis if multiple companies
			$whereClause.="(";
			foreach($companies as $name){
				if($hasWhere==true)
					{
						$whereClause .= " OR ";
					}
				$whereClause .= " CompanyName  LIKE '%". trim($name)."%' ";
				$hasWhere=true;
				
			}
			$whereClause.=")";
		}else{
			$whereClause .= " CompanyName  LIKE '%". $name."%' ";
			$hasWhere=true;
		}
	
	}
	if(isset($_POST["salary"]))
	{
	
		if($_POST["salary"]!=0){
		
			if($hasWhere==true)
				{
					$whereClause .= " AND ";
				}
			$whereClause .= "JobJLowRange >= " .$_POST["salary"];
				$hasWhere=true;
		}
	}
	
		if(isset($_POST["salarymax"]))
	{
		if($_POST["salarymax"]!=0){
		
		if($hasWhere==true)
			{
				$whereClause .= " AND ";
			}
		$whereClause .= "JobHighRange <= " .$_POST["salarymax"];
			$hasWhere=true;
		}
	}
	
	if(trim($_POST["jobname"])!='')
	{
		if($hasWhere==true)
		{
			$whereClause .= " AND ";
		}
		$hasWhere=true;
		
	$positions = explode(';', $_POST["jobname"]);
		if(count($positions)>1){
			
			$whereClause .=" (";
			$first = true;
			foreach($positions as $p){
				if($first){
					$first=false;
					$whereClause .= "JobTitle = '".trim($p) ."'";
				}else{
					$whereClause .= " OR JobTitle ='".trim($p) ."' ";
				}
			
			}
			$whereClause.=") ";

		
		}else{
			$whereClause .= "JobTitle LIKE '%".$_POST["jobname"] ."%'";
			}
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
	
	
	
	if(!$hasWhere){
	$whereClause ="";
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
		echo $sql."<br>";
		    echo $conn->error;
		} else {
		
		  $array = array();	
		  echo "For easier grading, here is the query based on the search parameters: <br><br> ". $sql."<br><br>";
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
</div>

</body>

<script language = "javascript">

function go(jobID){
	location.assign("viewJob.php?jobid="+jobID);
}
</script>

</html>
