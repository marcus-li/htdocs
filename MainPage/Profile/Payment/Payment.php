<!doctype html>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<html>
<?php session_start();
if(!isset($_SESSION['login_user'])){
	
	//in case of using back in browser after logging out
	if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
				$uri = 'https://';
			} else {
				$uri = 'http://';
			}
			$uri .= $_SERVER['HTTP_HOST'];
			header('Location: '.$uri.'/login/login_main.php');
			exit;
	};?>
<head>

<meta charset="utf-8">
<title>New Job Payment (Poster)</title>
<meta name="keywords" content="New Job Payment">
<link href="../../stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
             <a class="topbutton" href = "../../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1><img src="../../../MainPage_img/PostNewJob.png"></h1>
  <div class="navbutton">
    <nav>
      <a class="side_button_select">New Job Payment</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>
<!----page content -->

<!-- BEGIN CONTENT -->
<div class = "content">

<h3 class = "contentHeader">2. Submit Payment:</h3>
<div style='padding-left:50px; padding-right:100px;'>
Insert Payment Information. To cancel, click on cancel.
</div><br><hr><br>

<h3 class = "contentHeader">Payment Information:</h3>

<!-- Payment Info-->

<div style='padding-left:50px; padding-right:100px;'>
<form method ='post' action="<?php $_PHP_SELF ?>">
            
    <?php
	include '../../../dbscripts/credentials.php';
	
	$PosterUserName = $_SESSION['login_user'];
	
	// The time in my VM is messed up so this should be just -2 minutes. now -362
	$newTime = strtotime('-361 minutes');
	$date = date('Y-m-d H:i:s', $newTime);

	$currDate = date("Y-m-d H:i:s");

	$sql = "SELECT * FROM job WHERE PosterUserName ='$PosterUserName' AND JobFillStatus = 'No' AND JobListDate > '$date'";
	
	$result = NULL;
	// Create connection
    $conn = new mysqli($address, $username, $password, $database);
	// Check connection	
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } else {
	    $result = $conn->query($sql);
		$info = $result->fetch_assoc();
		if (!$result) {
		    echo "<b>database result error</b>";
			exit;
		}else{
			$PaymentMethod = array(
		"",
		"Bank",
		"Credit"
		,"Online"
		);	
			}
    }?>
            
			<table border='0'><tr>
           	<!-- I need to generate the paymentID auto from the db-->
			<td>PaymentID: </td><td><input name="PaymentID" id="CompanyId" hidden/></td></tr>
			<td>PaymentAmount: </td> <td><input name = 'PaymentAmount' id="PaymentAmount" value="200.00" readonly/>$</td></tr>		
			<tr><td>Payment Status: </td><td> <input  name = "PaymentStatus" id="PaymentStatus" value="In-Transit" readonly/></td></tr>
			<tr><td>Payment Date: </td><td>
<?php 
echo "<input name='PaymentDate' id='PaymentDate' value='". date("Y-m-d") ."' />";
echo "</td></tr>";
?>
			<tr><td>JobId: </td><td> <input  name = "JobID" id="JobID" value="<?php echo $info["JobID"];?>" readonly/></td></tr>
            <tr><td>Payment Method: </td><td><select class="select" name = "PaymentMethod" id="PaymentMethod" onChange="changeSelected(this)">
			<?php
				foreach($PaymentMethod as $type){
				echo "<option value='".$type."' ";
				echo ">".$type."</option>";
				}
			echo "</select></td></tr>";
			?>
            <tr><td colspan='2' align='center'><br><input type="submit" value="Make Payment" name="submit"></td></tr>
            
</table></form></div><br><hr><br>	
            
	<?php
	if(isset($_POST["PaymentMethod"]))
	{	
		include '../../../dbscripts/credentials.php';
		
		$sql = "INSERT INTO payment (PaymentAmount, PaymentStatus, JobID, 		PaymentMethod) VALUES (
	'".$_POST["PaymentAmount"]."',
	'".$_POST["PaymentStatus"]."',
	'".$_POST["JobID"]."', 
	'".$_POST["PaymentMethod"]."');";
	
	$jid = $_POST["JobID"];
		
		$conn = new mysqli($address, $username, $password, $database);
		
			$result = NULL;
		  
			// Create connection
			$conn = new mysqli($address, $username, $password, $database);
			// Check connection	
			 if ($conn->connect_error) {
				die("Connection failed: " . $conn->connect_error);
			} else {
				$conn->multi_query($sql);
			}
		
		echo '<h3 class = "contentHeader">Type of Payment: ' .$_POST["PaymentMethod"]. "</h3>";
		echo "<div style='padding-left:50px; padding-right:100px;'>";

		// <!-- Type of Payment-->
		
		if($_POST["PaymentMethod"] == "Bank"){
			displayBankPayment($conn, $jid);
		}elseif($_POST["PaymentMethod"] == "Credit"){
			displayCreditCardPayment($conn, $jid);
		}elseif ($_POST["PaymentMethod"] == "Online"){
			displayOnlineService($conn, $jid);
		}
		
		$conn->close();
	}
	?>
 
</div>
</body>
</html>

<?php

	function displayBankPayment($conn, $jid){
		
		$sql = "SELECT * FROM payment WHERE PaymentMethod = 'bank' AND JobID ='".$jid."';";
	
		$result = NULL;
		
		$result = $conn->query($sql);
		$pid = $result->fetch_assoc();
		
		echo $pid["PaymentDate"];
		
		echo "<form method ='post' action='addBankPayment.php'>";

		echo "<table border='0'><tr>";
		
		echo '<tr><td>Bank Name: </td><td> <input  name = "BankPaymentName" id="BankPaymentName"></td></tr>';
			echo '<tr><td>Bank Payment Number: </td><td> <input  name = "BankPaymentNumber" id="BankPaymentNumber"></td></tr>';
			echo '<tr><td>Bank Payment Account Number: </td><td> <input  name = "BankPaymentAcctNumber" id="BankPaymentAcctNumber"></td></tr>';
			// Needs a select from the previous page => payment
			echo '<tr><td>PaymentID: </td><td> <input  name = "PaymentID" id="PaymentID" value="'.$pid["PaymentID"].'" readonly></td></tr>';
			echo '<tr><td>JobID: </td>';
			echo '<td> <input  name = "JobID" id="JobID" value="'.$pid["JobID"].'" readonly></td>';
			
		echo "<tr><td colspan='2' align='center'><br><input  type='submit' name = 'submit' value = 'Submit'></td></tr>";
			echo "<tr><td colspan='2' align='center'><input  type='submit' name = 'cancel' value = 'Cancel'></td></tr>";
  
  		echo "<div></td></tr>";
  
  		echo "</table></form></div><br><hr><br>";
	}
	
	function displayCreditCardPayment($conn, $jid){
		$sql = "SELECT * FROM payment WHERE PaymentMethod = 'credit' AND JobID ='".$jid."';";
	
		$result = NULL;
		
		$result = $conn->query($sql);
		$pid = $result->fetch_assoc();
		
		echo $pid["PaymentDate"];
		
		echo "<form method ='post' action='addCreditCardPayment.php'>";

		echo "<table border='0'><tr>";
		
		echo '<tr><td>Credit Card Number: </td><td> <input  name = "CreditCardNumber" id="CreditCardNumber"></td></tr>';
			echo '<tr><td>Credit Card Type: </td><td> <input  name = "CreditCardType" id="CreditCardType"></td></tr>';
			echo '<tr><td>Credit Card Expiration Date: </td><td> <input  name = "CreditCardExpirDate" id="CreditCardExpirDate"></td></tr>';
			echo '<tr><td>Credit Card Date: </td><td> <input  name = "CreditCardDate" id="CreditCardDate"></td></tr>';
			// Needs a select from the previous page => payment
			echo '<tr><td>PaymentID: </td><td> <input  name = "PaymentID" id="PaymentID" value="'.$pid["PaymentID"].'" readonly></td></tr>';
			echo '<tr><td>JobID: </td>';
			echo '<td> <input  name = "JobID" id="JobID" value="'.$pid["JobID"].'" readonly></td>';
		
		echo "<tr><td colspan='2' align='center'><br><input  type='submit' name = 'submit' value = 'Submit'></td></tr>";
			echo "<tr><td colspan='2' align='center'><input  type='submit' name = 'cancel' value = 'Cancel'></td></tr>";
  
  		echo "<div></td></tr>";
  
  		echo "</table></form></div><br><hr><br>";
	}
	
	function displayOnlineService($conn,$jid){
		$sql = "SELECT * FROM payment WHERE PaymentMethod = 'online' AND JobID ='".$jid."';";
		
		echo $jid;
		
		$result = NULL;
		
		$result = $conn->query($sql);
		$pid = $result->fetch_assoc();
		
		echo $pid["PaymentDate"];
		
		echo "<form method ='post' action='addOnlineServicePayment.php'>";

		echo "<table border='0'><tr>";
		
		echo '<tr><td>Service Name: </td><td> <input  name = "ServiceName" id="ServiceName"></td></tr>';
			// Should this one be autogenerated?
			echo '<tr><td>Service Transaction Id: </td><td> <input  name = "ServiceTransID" id="ServiceTransID"></td></tr>';
			echo '<tr><td>Service Fee: </td><td> <input  name = "ServiceFee" id="ServiceFee"></td></tr>';
			// Needs a select from the previous page => payment
			echo '<tr><td>PaymentID: </td><td> <input  name = "PaymentID" id="PaymentID" value="'.$pid["PaymentID"].'" readonly></td></tr>';
			echo '<tr><td>JobID: </td>';
			echo '<td> <input  name = "JobID" id="JobID" value="'.$pid["JobID"].'" readonly></td>';
		
		echo "<tr><td colspan='2' align='center'><br><input  type='submit' name = 'submit' value = 'Submit'></td></tr>";
			echo "<tr><td colspan='2' align='center'><input  type='submit' name = 'cancel' value = 'Cancel'></td></tr>";
  
  		echo "<div></td></tr>";
  
  		echo "</table></form></div><br><hr><br>";
	}
?>

<script>
 function changeSelected(obj){
    //alert(obj.options[obj.selectedIndex].value);
	var paymentSel = obj.options[obj.selectedIndex].value;
	$("#status").html('The payment method selected is: <STRONG>' + paymentSel + '</STRONG>.');
  }
</script>

<script type="text/javascript">

  document.getElementById('date').value = Date();
</script>