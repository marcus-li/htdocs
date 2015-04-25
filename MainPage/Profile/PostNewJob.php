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


			<div style='padding-left:50px; padding-right:100px;'><form method ='post' action='submitEduUpdate.php'>
			<table border='0'><tr>
			<td>CompanyID: </td><td><input name="CompanyId"><?php 
			
			$conn = new mysqli('localhost', 'root', 'TiamenT12#', 'uconnjobsearch') 
or die ('Cannot connect to db');

			$result = $conn->query("SELECT CompanyId FROM company");
			
			while ($row = $result->fetch_assoc()){
				echo "<option value=\"CompanyId\">" . $row['CompanyId'] . "</option>";
			}
			echo "</select></td></tr>";
			?>
			<td>CompanyName:</td> <td><select name = 'CompanyName'></select></td></tr>		
			<tr><td>Company Street: </td><td> <select  name = "CompanyStreet" > </select></td></tr>
			<tr><td>Company City: </td><td> <select  name = "CompanyCity" > </select></td></tr>
			<tr><td>Company Email: </td><td> <select  name = "CompanyEmail" > </select></td></tr>
            <tr><td>Company Phone: </td><td> <select  name = "CompanyPhone" > </select></td></tr>
            <tr><td>Company Fax: </td><td> <select  name = "CompanyFax" > </select></td></tr>
            <tr><td>Company Home Page: </td><td> <select  name = "CompanyHomePage" > </select></td></tr>
            
			<tr><td colspan='2' align='center'><br><input  type='submit' name = 'add' value = 'Add'></td></tr>
			</table></form></div><br><hr><br>	
</div>
</body>
</html>





