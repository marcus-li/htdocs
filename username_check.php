<?php

if(isSet($_POST['username']))
{
$UserName = $_POST['username'];

$dbHost = 'localhost';
$dbUsername = 'root';
$dbPassword = '6379133#';
$dbDatabase = 'uconnjobsearch';

$db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

$sql_check = mysql_query("select UserName from user where UserName='".$username."'") or die(mysql_error());

if(mysql_num_rows($sql_check))
{
echo '<font color="red">The user-name <STRONG>'.$username.'</STRONG> is already in use.</font>';
}
else
{
echo 'OK';
}

}
?>
