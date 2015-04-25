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
	};

?>
<meta charset="utf-8">
<title>Manage Application</title>
<meta name="keywords" content="Manage Application">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="profile/Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1><img src="../MainPage_img/manage application.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button" href="Main_Page.php">Main Page</a>
      <a class="side_button" href="Search.php">Search</a>
      <a class="side_button_select">Manage Applications</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>

</body>
</html>
