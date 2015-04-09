


<?php
	include 'credentials.php';
	 // Create connection
    $conn = new mysqli($address, $username, $password, $database);
	$sql = "SELECT username FROM user where username =  '".$_GET['param1']."'";
	$result = NULL;
    // Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		if (!$result) {
		    throw new Exception("Database Error [{$this->database->errno}] {$this->database->error}");
		} else {
		    $array = array();	
			   while($row = $result->fetch_assoc()) $array[] = $row;
			echo $result->num_rows;//	Echo result in JSON
		
		}
		
		$conn->close();
    }

	
	//check if username exists in the database

?>
