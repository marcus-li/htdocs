<!doctype html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
 
 
 
 
 <script langauge = "javascript">
 
 function display(sql){
 
  $.ajax({
			type : 'POST',
			url : 'displayResults.php',
			data: {sql :sql},	
			success: function(data)
			{
			  $('#resultDiv').html(data);
			}  
			});
 }
function report1(){

//name address email ordered by state
			var columns = 'UserLastName as "Last Name", UserFirstName as "First Name",  UserEmail as "Email"' +
						', UserStreet1 as "Street" , UserStreet2 as "Street (extended)", UserCity as "City", UserState as "State" , UserZip as "Zip" ';
			var sql = 'SELECT '+columns+' from USER, seeker where user.username = seeker.username order by user.userstate,user.userlastname'; 
			
		display(sql);
}

function report2(){
	var filter = document.getElementById('report2').value;
	if(filter==""){
	alert('please input a last name');
	}
	
	var cols = 'User.Username ,		User.UserFirstName as "First Name", job.CompanyName, job.jobid, job.JobListDate, job.JobTitle';
	var sql = "SELECT " + cols + "  FROM applies, user,job" +
			" where  seekerUserName = '"+filter+"' and user.userlastname = 'admin' and job.jobid = applies.Job_JobID order by Username";
			display(sql);
}

function report3(){
	
	alert("TODO report 3");
}
function report4(){
	
	alert("TODO report 4");
}
function report5(){
	
	alert("TODO report 5");
}
function report6(){
	
	alert("TODO report 6");
	
	//TODO: get jobid
	var sql = "SELECT UserFirstName, UserLastName, UserStreet1, UserStreet2, UserEmail FROM uconnjobsearch.user u INNER join  seeker s ON(u.Username = s.Username) WHERE jobID = ''" ;
}
function report7(){

	alert("TODO report 7");
}
function report8(){

	alert("TODO report 8");
}

function report9(){

	alert("TODO report 9");
}



function report10(){

	alert("TODO report 10");
}
</script>
 
 
 
 
 
 
 
 
 
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

<meta charset="utf-8">
<title>MainPage</title>
<meta name="keywords" content="main page, basic">
<link href="../mainpage/stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>

<body>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
    		<a>Welcome!</a>
            <a class="topbutton" href = "../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</b></a>
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<div class="sidebar">
  <h1><img src="../MainPage_img/Uconn's Job Search.png"></h1>
  <div class="navbutton">
    <nav>
  
	
  
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->
</header>

<div class="content" ><br><br>
<br><br>
<div style = "padding-left: 80px">
<form method="post" action="<?php $_PHP_SELF ?>" name="send">Start a new report: 
<select name="chooseReport">
	<option value = 1> Show All Seekers By State</option>
	<option value = 2> Show Applications By Last Name </option>
	<option value = 3> Show Company Posted Jobs</option>
	<option value = 4> Jobs Posted Within Date Range</option>
	<option value = 5> Salary Position Filter</option>
	<option value = 6> Show Applications By Job</option>
	<option value = 7> Show Seekers By Education </option>
	<option value = 8> Show Transactions By Date Range </option>
	<option value = 9> Filter Jobs By Skill Requirements</option>
	<option value = 10> Filter Seekers By Listed Skills</option>
	</select>

		<input class="button" type="submit" value="Go" name="submitBtn" id="button" >
</form>
<br><br><hr><br>

<?php 
	if(isset($_POST['chooseReport'])){
	$selectedReport = $_POST['chooseReport'];
		if($selectedReport ==1){
			echo "Show all seeksers sorted by state";
			echo "<script language = 'javascript'>
			report1();
			</script>
		";
		}elseif($selectedReport==2){
		echo "Show applications by last name<br><br>";
		echo "Last Name: <input id='report2' type='text'/>";
		echo "<input type='submit' value='Go' onclick='report2()'><br><br>";
		}elseif($selectedReport==3){
		echo "1";
		}elseif($selectedReport==4){
		echo "1";
		}elseif($selectedReport==5){
		echo "1";
		}elseif($selectedReport==6){
		echo "Select based on jobid<br><br>";
		echo "Last Name: <input id='job' type='text'/>";
		echo "<input type='submit' value='Go' onclick='report6()'>";
		}elseif($selectedReport==7){
		echo "1";
		}elseif($selectedReport==8){
		echo "1";
		}elseif($selectedReport==9){
		echo "1";
		}elseif($selectedReport==10){
		echo "1";
		}
	}
?>
<div name="resultDiv" id = "resultDiv"></div>
</div></div>

</body>


</html>
