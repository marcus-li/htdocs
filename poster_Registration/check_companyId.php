<?php
include '../dbscripts/credentials.php';
if(isSet($_POST['CompanyId']))
{
$CompanyId = $_POST['CompanyId'];
$dbHost = $address ;
$dbUsername = $username;
$dbPassword = $password;
$dbDatabase = $database;

$db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

$sql_check = mysql_query("select CompanyName from company where CompanyId='".$CompanyId."'") or die(mysql_error());

if(mysql_num_rows($sql_check))
{
		$myrow = mysql_fetch_array($sql_check);
		$result = $myrow[0];
	echo '<center><font color="blue">The CompanyName is <STRONG>'.$result.'</STRONG>.</font></center>';
}
else
{
	echo '<center><font color="red">The CompanyID <STRONG>'.$CompanyId.'</STRONG> does not exist.</font></center>';
}

}
?>