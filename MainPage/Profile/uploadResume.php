<?php
	include '../../dbscripts/credentials.php';
		if(!isset($_FILES["file"])){
	echo var_dump($_POST);
	echo var_dump($_FILES);
	echo "no data";
	exit;
	}
	
	$fileName = $_FILES['file']['name'];
	$tmpName  = $_FILES['file']['tmp_name'];
	$fileSize = $_FILES['file']['size'];
	$fileType = $_FILES['file']['type'];

	$fp      = fopen($tmpName, 'r');
	$content = fread($fp, filesize($tmpName));
	$content = addslashes($content);
	fclose($fp);

	if(!get_magic_quotes_gpc())
	{
    $fileName = addslashes($fileName);
	}
	
	
	
	
	
	
	
	
	
	$result = NULL;
	$sql = "UPDATE resume SET resumefilename ='".$fileName."' , resumeFile = '".$content."' where resumeid = '".$_POST["resumeID"]."';";  
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
		echo "fail";
    } else {
	
	
	$stmt = $conn->prepare("UPDATE resume SET resumefilename ='".$fileName."' , resumeFile = ? where resumeid = '".$_POST["resumeID"]."';");
	
	/*The $null variable is needed, because bind_param() always wants a variable reference for a given parameters. In this case the "b" (as in blob) parameter. So $null is just a dummy, to make the syntax work.*/
	$null = NULL;
	$stmt->bind_param("b", $null);
	$stmt->send_long_data(0, $content);
	$stmt->execute();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	    //$conn->query($sql);
		$conn->close();
		echo "success";
    }?>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	