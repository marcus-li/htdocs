<?php
/**
 * Step 1: Require the Slim Framework
 *
 * If you are not using Composer, you need to require the
 * Slim Framework and register its PSR-0 autoloader.
 *
 * If you are using Composer, you can skip this step.
 */
require 'Slim/Slim.php';

\Slim\Slim::registerAutoloader();

/**
 * Step 2: Instantiate a Slim application
 *
 * This example instantiates a Slim application using
 * its default settings. However, you will usually configure
 * your Slim application now by passing an associative array
 * of setting names and values into the application constructor.
 */
$app = new \Slim\Slim();

/**
 * Step 3: Define the Slim application routes
 *
 * Here we define several Slim application routes that respond
 * to appropriate HTTP request methods. In this example, the second
 * argument for `Slim::get`, `Slim::post`, `Slim::put`, `Slim::patch`, and `Slim::delete`
 * is an anonymous function.
 */

// GET route
$app->get('/', function () {
	echo phpinfo();       
});

$env = $app->environment();
$env['dbUser'] = "root";
$env['server'] = "localhost";
$env['dbPass'] = "";
$env['dbName'] = "uconnjobsearch";


//	Get all jobs
$app->get('/jobs', function() use ($env) {
	$sql = "SELECT * FROM job";
	$result = NULL;
	// Create connection
    $conn = new mysqli($env['server'], $env['dbUser'], $env['dbPass'], $env['dbName']);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		
		if (!$result) {
		    throw new Exception("Database Error [{$this->database->errno}] {$this->database->error}");
		} else {
		    $array = array();
			
		/*	
			//new code
			echo "<table>";
			echo "<tr><th>JobID</th><th>JobTitle</th></tr>";
			
			while($row = mysqli_fetch_array($result)) {
				$JobID = $row['JobID'];
				$JobTitle = $row['JobTitle'];
				echo "<tr><td style='width: 400px;'>".$JobID."</td><td style='width: 			              600px;'>".$JobTitle."</td></tr>";
			} 
			
			echo "</table>";
		*/
			
			//end new code
		    while($row = $result->fetch_assoc()) $array[] = $row;
			
			//	Echo result in JSON
			echo json_encode($array)."\n";	
		}
		
		$conn->close();
    }
});

$app->get('/usernames', function() {
	$sql = "SELECT username FROM user";
	
	$dbServerName = "localhost";
    $dbUser = "root";
    $dbPassword = "";
    $dbName = "uconnjobsearch";
	
	$result = NULL;
    
	// Create connection
    $conn = new mysqli($dbServerName, $dbUser, $dbPassword, $dbName);

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
			
			echo json_encode($array);	//	Echo result in JSON
		}
		
		$conn->close();
    }
});


//check if username exists in the database

$app->get('/user_exists/:name', function($name) use($env){
	$sql = "SELECT username FROM user where username = '".$name."'";

	$result = NULL;
	// Create connection
    $conn = new mysqli($env['server'], $env['dbUser'], $env['dbPass'], $env['dbName']);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		
		if (!$result) {
		    throw new Exception("Database Error [{$this->database->errno}] {$this->database->error}");
		} else {
		    $array = array();	
			echo $result->num_rows;
			
		
		}
		
		$conn->close();
    }
});


/**
 * Step 4: Run the Slim application
 *
 * This method should be called last. This executes the Slim application
 * and returns the HTTP response to the HTTP client.
 */
$app->run();
