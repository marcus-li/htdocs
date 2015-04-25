<?php
include('login.php'); // Includes Login Script

if(isset($_SESSION['login_user'])){
header("Location: ../MainPage/main_page.php");
}
?>
<!DOCTYPE html>
<html>
<head>
<title>UConn Job Search</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>


<body>
<div class="topbar">
  <h1>UConn's Job Search</h1>
  </div>
  
  <div id="login">
    <form action="" method="post">
      <label>UserName:</label>
      <input id="UserName" name="UserName" placeholder="Username" type="text">
      <label>Password:</label>
      <input id="UserPassword" name="UserPassword" placeholder="Password" type="password">
      <b  id="Register"><a class="register" href="../Registration/register.php">Not registered yet? Register</a></b>
      <input name="submit" type="submit" value=" Login ">
      <span><?php echo $error; ?></span>
    </form>
  </div>

</body>
</html>