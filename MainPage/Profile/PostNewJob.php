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
<title>UConn's Job Search (Poster)</title>
<meta name="keywords" content="Post New Job">
<link href="../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="../Main_Page.php">Seeker</a>
             <a href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1>UConn's Job Search (Poster)</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage">Post New Job</a>
      <a class="HomePage" href="ReviewJobs.php">Review Jobs Previously Posted</a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>
<!----page content -->

<!-- BEGIN CONTENT -->
<div class = "content">

<h3 class = "contentHeader">Post New Jobs:</h3>
	<div style = "padding-left: 80px">Display jobs previously posted. Exclusive option for Posters.</div>

<h3 class = "contentHeader">Post New Job:</h3>

<!-- post a new job-->

<div style='padding-left:50px; padding-right:100px;'>
<form method ='post' action='submitPaymentMethod.php'>
            
    <?php
	include '../../dbscripts/credentials.php';

	$sql = "SELECT * FROM company WHERE CompanyId = '12'";
	
	$result = NULL;
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		$info = $result->fetch_assoc();
		if (!$result) {
		    echo "<b>database result error</b>";
			exit;
		} 
    }?>
            
			<table border='0'><tr>
            
			<td>CompanyID: </td><td><input name="CompanyId" id="CompanyId" value="<?php echo $info["CompanyId"];?>" readonly="readonly"/></td></tr>
			<td>CompanyName:</td> <td><input name = 'CompanyName' id="CompanyName" value="<?php echo $info["CompanyName"];?>" readonly="readonly"/></td></tr>		
			<tr><td>Company Street: </td><td> <input  name = "CompanyStreet" id="CompanyStreet1" value="<?php echo $info["CompanyStreet1"];?>" readonly="readonly"/></td></tr>
			<tr><td>Company City: </td><td> <input  name = "CompanyCity" id="CompanyCity" value="<?php echo $info["CompanyCity"];?>" readonly="readonly"/></td></tr>
			<tr><td>Company Email: </td><td> <input  name = "CompanyEmail" id="CompanyEmail" value="<?php echo $info["CompanyEmail"];?>" readonly="readonly"/></td></tr>
            <tr><td>Company Phone: </td><td> <input  name = "CompanyPhone" id="CompanyPhone" value="<?php echo $info["CompanyPhone"];?>" readonly="readonly"/></td></tr>
            <tr><td>Company Fax: </td><td> <input  name = "CompanyFax" id="CompanyFax" value="<?php echo $info["CompanyFax"];?>" readonly="readonly"/></td></tr>
            <tr><td>Company Home Page: </td><td> <input  name = "CompanyHomePage" id="CompanyHomePage" value="<?php echo $info["CompanyHomePage"];?>" readonly="readonly"/></td></tr>
            
			<tr><td colspan='2' align='center'><br><input  type='submit' name = 'add' value = 'Add'></td></tr>
			</table></form></div><br><hr><br>	
 
 <?php
	$conn->close();
?>
 
</div>
</body>
</html>





