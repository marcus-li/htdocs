
<?php 
if(!isset($_POST['sql']))
{
	echo "no results to display";
	exit;
}
	include '../dbscripts/credentials.php';
	$conn = new mysqli($address, $username, $password, $database);
	$sql = $_POST['sql'];
	if(!$result = $conn->query($sql)){
		echo $conn->error;
		exit;
	}
	$fieldsArr = $result->fetch_fields();
	echo "<div style='overflow:auto;'><table border =2><tr>";
	foreach ($fieldsArr as $colName) {
		echo "<td>".$colName->name."</td>";
	}
	 while ($row = mysqli_fetch_row($result)) {
		echo "<tr>";
		
		foreach($row as $cell){
		
		echo "<td>".$cell."</td>";
	}
		echo "</tr>";
	
	}
	echo "</table></div>";
	
	$conn->close();
?>

