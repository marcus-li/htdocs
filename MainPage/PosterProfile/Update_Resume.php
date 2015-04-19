 <!doctype html>
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
  <h1>Update Profile</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage">Resume</a>
      <a class="HomePage" href="Update_Edu.php">Education background</a>
      <a class="HomePage" href="Update_Exp.php">Work Experience</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>

</body>
</html>
