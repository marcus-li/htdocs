<?php
session_start(); // Starting Session
$error=''; // Variable To Store Error Message
if (isset($_POST['submit'])) {
if (empty($_POST['UserName']) || empty($_POST['UserPassword'])) {
$error = "Username or Password is invalid";
}
else
{
// Define $username and $password
$UserName=$_POST['UserName'];
$UserPassword=$_POST['UserPassword'];
// Establishing Connection with Server by passing server_name, user_id and password as a parameter
$connection = mysql_connect("localhost", "root", "TiamenT12#");
// To protect MySQL injection for Security purpose
$UserName = stripslashes($UserName);
$UserPassword = stripslashes($UserPassword);
$UserName = mysql_real_escape_string($UserName);
$UserPassword = mysql_real_escape_string($UserPassword);
// Selecting Database
$db = mysql_select_db("uconnjobsearch", $connection);
// SQL query to fetch information of registerd users and finds user match.
$query = mysql_query("select * from user where UserPassword='$UserPassword' AND UserName='$UserName'", $connection);
$rows = mysql_num_rows($query);
if ($rows == 1) {
$_SESSION['login_user']=$UserName; // Initializing Session
header("location: profile.php"); // Redirecting To Other Page
} else {
$error = "Username or Password is invalid";
}
mysql_close($connection); // Closing Connection
}
}
?>