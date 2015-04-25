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
    <nav>
    		<a>Welcome!</a>
    		<a class="PosterPage" href="Profile/PostNewJob.php">Poster</a>
         	<a class="HomePage" href="Profile/Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
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

</body>
</html>
