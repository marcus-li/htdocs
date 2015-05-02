<?php
include '../dbscripts/credentials.php';
if(isSet($_POST['CompanyName']))
{
$CompanyName = $_POST['CompanyName'];
$dbHost = $address ;
$dbUsername = $username;
$dbPassword = $password;
$dbDatabase = $database;

$db = mysql_connect($dbHost, $dbUsername, $dbPassword) or die ("Unable to connect to Database Server.");
mysql_select_db ($dbDatabase, $db) or die ("Could not select database.");

$sql_check = mysql_query("select CompanyId from company where CompanyName='".$CompanyName."'") or die(mysql_error());

if(mysql_num_rows($sql_check))
{
		$myrow = mysql_fetch_array($sql_check);
		$result = $myrow[0];
		$_SESSION['cid'] = $result;
	echo '<center><font color="blue">The CompanyId for your company is <STRONG>'.$result.'</STRONG>.</font></center>';
}
else
{
	echo '<center><font color="red">The CompanyName <STRONG>'.$CompanyName.'</STRONG> does not exist.</font></center>';
}

}
?>