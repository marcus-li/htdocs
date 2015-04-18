<?php
include('login.php'); // Includes Login Script

if(isset($_SESSION['login_user'])){
header("location: profile.php");
}
?>
<!DOCTYPE html>
<html>
<head>
<title>UConn Job Search Login</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="main">
<h1>UConn Job Search Login</h1>
<div id="login">
<h2>Login Form</h2>
<form action="" method="post">
<label>UserName :</label>
<input id="UserName" name="UserName" placeholder="username" type="text">
<label>Password :</label>
<input id="UserPassword" name="UserPassword" placeholder="**********" type="password">
<b id="Register"><a href="../Registration/register.php">Not registered yet? Register</a></b>
<input name="submit" type="submit" value=" Login ">
<span><?php echo $error; ?></span>
</form>
</div>
</div>
</body>
</html>