 <!doctype html>
<html>
<head>
<?php session_start();?>
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
         	<a class="HomePage" href="Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1>Manage Application</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage" href="Main_Page.php">Main Page</a>
      <a class="HomePage" href="Search.php">Search</a>
      <a class="HomePage">Manage Applications</a>

  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>

</body>
</html>
