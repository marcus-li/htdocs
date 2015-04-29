

<?php
	session_start();
	include '../dbscripts/credentials.php';
	if(!isset($_POST['jobid'])){
	echo "failed to find query";
	exit;
	}
	$query = "insert into applies (Job_JobID,SeekerUserName,ResumeId) values(".$_POST['jobid'].", '".$_SESSION['login_user']."',".$_POST['resumeid'].");";
	
    
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
		$result = $conn->query( "select count(*) from applies where SeekerUserName = '".$_SESSION['login_user']."' AND Job_JobID = ".$_POST['jobid']);
		$applications = $result->fetch_array(MYSQLI_NUM)[0];
		if($applications>0){
		echo "already applied " ;
		}else{
	
		$result = null;
	    $result = $conn->query($query)  or trigger_error("Query Failed! SQL: $sql - Error: ".mysqli_error(), E_USER_ERROR);
		echo "successfully applied";
		}
		$conn->close();
		
    }
	
?> 

