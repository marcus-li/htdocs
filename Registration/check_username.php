<?php
include '../dbscripts/credentials.php';
if(isSet($_POST['UserName']))
{
$UserName = $_POST['UserName'];
$dbHost = $address ;
$dbUsername = $username;
$dbPassword = $password;
$dbDatabase = $database;

$db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

$sql_check = mysql_query("select UserName from user where UserName='".$UserName."'") or die(mysql_error());

if(mysql_num_rows($sql_check))
{
echo '<center><font color="red">The user-name <STRONG>'.$UserName.'</STRONG> is already in use.</font></center>';
}
else
{
echo 'OK';
}

}
?>