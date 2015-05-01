<?php session_start(); ?>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="../mainpage/profile/jquery-ui.min.js"></script>
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
	
	var filter = document.getElementById('report3').value;
	if(filter==""){
	alert('please input a company\'s name');
	}
	
	var sql = "select  JobTitle, JobID, JobListDate , JobFillStatus FROM job "+
 "where CompanyName = '"+filter+"' order by JobTitle";
			display(sql);
}
function report4(){
	/*When a date range (start and end date) is entered, display all of the jobs newly listed, including the company name, job id, job list date, and job title.*/
}
function report5(){
	
/*When given a salary value and a job title, display all of the jobs including: company name, job id, job list date, and salary.*/
	
	var lowinput = document.getElementById('salary').value;
	if(!$.isNumeric(lowinput))
	{
		alert('please enter minimum salary requirement in USD');
		return;
	}
	
	
	
	var jobposition = document.getElementById('jobtitle').value;
	if(jobposition=="")
	{
		alert('please enter a position');
		return;
	}
	var sql = "SELECT CompanyName, JobID, JobListDate, JobJLowRange, JobHighRange FROM job where JobJLowRange>" + lowinput + 
	" and JobTitle = '" + jobposition+"'";
	display(sql);
}
function report6(){
	
	var jobid = document.getElementById('job').value;
	
	var sql = "SELECT UserFirstName, UserLastName, UserStreet1, UserStreet2, UserEmail FROM user, applies WHERE user.UserName = applies.seekerUserName and applies.job_jobID = "+jobid ;
	display(sql);
	
}
function report7(){

	
	var edu = document.getElementById('edu').value;
	if(edu==''){
	alert('please fill in a school');
	return;
	}
	var sql = "SELECT UserFirstName, UserLastName, UserStreet1, UserStreet2, UserEmail  FROM uconnjobsearch.user u INNER join  education s ON(u.UserName = s.UserID) WHERE EducationUniversity = '" + edu + "' AND EducationDegreeType = 'bachelors'";
	display(sql);
	
}
function report8(){
	/*Generate a payment report for UConnJobSearch that is initiated by a date range (start and end date) and includes the payment ID, Payment amount, Payment status, payment type (invoice, credit card or bank), and payment date, for all jobs listed between that date range.*/
}

function report9(){

	
	
	var where = " ";
	var whereinit = 0;

	var skills = document.getElementsByName("skills");
	var skillList = "";
	for(var i=0;i<skills.length;i++){
	if(skills[i].checked){
			if(!whereinit){ 
			whereinit=1;
			where = where + " WHERE skillid="+ skills[i].value + " " ;
			}else{
			where = where + " OR  skillid="+skills[i].value + " " ;
			}
		}
	}
	
	
	var sql = "SELECT u.JobID,u.JobListDate,u.JobTitle FROM uconnjobsearch.job u INNER JOIN jobskillrequirements s ON (u.JobID = s.JobId) "+where + " group by u.jobid";
	
	display(sql);
}



function report10(){
var where = " ";

	var whereinit = 0;
	var skills = document.getElementsByName("skills");
	var skillList = "";
	for(var i=0;i<skills.length;i++){
	if(skills[i].checked){
			if(!whereinit){ 
				whereinit=1;
				where = where + " AND ( rls.SkillID = "+ skills[i].value + " " ;
			}else{
				where = where + " OR  rls.skillid="+skills[i].value + " " ;
			}
		}
	}
	if(whereinit){
	
	where = where + ")";
	}
	var sql = "SELECT u.username, u.UserFirstName, u.UserLastName, u.UserStreet1, u.UserStreet2, u.UserEmail FROM user u , seeker s, resume r, resumelistedskills rls where rls.ResumeID = r.ResumeID and r.SeekerId = s.UserName and u.UserName = s.UserName" + where+ " group by u.username";
	display(sql);
}
</script>
<head><?php 
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
<link href="../mainpage/profile/jquery-ui.css" rel="stylesheet">
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
include '../dbscripts/credentials.php';
	  $conn = new mysqli($address, $username, $password, $database);
	 if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
		exit;
    }
	
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
			echo "Show Company's Postings<br><br>";
			echo "Company Name: <input id='report3' type='text'/>";
			echo "<input type='submit' value='Go' onclick='report3()'><br><br>";
		}elseif($selectedReport==4){
		
			echo "When a date range (start and end date) is entered, display all of the jobs newly listed, including the company name, job id, job list date, and job title.";
			echo "<br><br>Start Date: ";   
			echo '<input name = "start" class = "datepicker" readonly> </input>';
			//Graduation Date
			echo "End Date: ";   
			echo '<input name = "end" class = "datepicker" readonly> </input>';
			echo "<input type='submit' value='Go' onclick='report4()'><br><br>";
		}elseif($selectedReport==5)
		{
			echo "Find job positions with at least the given salary: <br><br>";
			echo "Min Salary: $<input id='salary' type='text'/>   ";
			echo "Job Position: <input id='jobtitle' type='text'/><br>";
			echo "<input type='submit' value='Go' onclick='report5()'>";
		
		}elseif($selectedReport==6){
			echo "Select based on jobid<br><br>";
			echo "JobId: <input id='job' type='text'/>";
			echo "<input type='submit' value='Go' onclick='report6()'>";
		}elseif($selectedReport==7){
			echo "Find bachelors degree holders from given university: <br><br>";
			echo "School:<input id='edu' type='text'/>   ";
			echo "<input type='submit' value='Go' onclick='report7()'>";
		}elseif($selectedReport==8){
			echo "Generate a payment report for UConnJobSearch that is initiated by a date range (start and end date) and includes the payment ID, Payment amount, Payment status, payment type (invoice, credit card or bank), and payment date, for all jobs listed between that date range.";
			
			echo "<br><br>Start Date: ";   
			echo '<input name = "start" class = "datepicker" readonly> </input>';
			//Graduation Date
			echo "End Date: ";   
			echo '<input name = "end" class = "datepicker" readonly> </input>';
			echo "<input type='submit' value='Go' onclick='report8()'><br><br>";
		}elseif($selectedReport==9){
			//Create a table to display all skills
			echo "<div style = 'align:center; overflow:auto'>";
			$result = $conn->query("select * from skills");
			echo $conn->error;
			$row = null;
			$rowCount=0;
			echo "<table border='1'>";
			while($row = $result->fetch_assoc()){
				$rowCount = $rowCount+1;
				if($rowCount ==0){
				echo "<tr>";
				}
				echo "<td><input type='checkbox' style='clear: right;float: left;margin-left: 10px;
					width: 100px;' name ='skills' value='".$row['SkillID']."'>" .$row['SkillName']."</td>";
				if($rowCount ==5){
				$rowCount =0;
				echo "</tr>";
				}
			}
			echo "</table></div>";
			echo "<input type='submit' value='Go' onclick='report9()'>";
		}elseif($selectedReport==10){
			//Create a table to display all skills
			echo "<div style = 'align:center; overflow:auto'>";
			$result = $conn->query("select * from skills");
			echo $conn->error;
			$row = null;
			$rowCount=0;
			echo "<table border='1'>";
			while($row = $result->fetch_assoc()){
				$rowCount = $rowCount+1;
				if($rowCount ==0){
				echo "<tr>";
				}
				echo "<td><input type='checkbox' style='clear: right;float: left;margin-left: 10px;
					width: 100px;' name ='skills' value='".$row['SkillID']."'>" .$row['SkillName']."</td>";
				if($rowCount ==5){
				$rowCount =0;
				echo "</tr>";
				}
			}
			echo "</table></div>";
			echo "<input type='submit' value='Go' onclick='report10()'>";
		}
	}
?>
<div name="resultDiv" id = "resultDiv"></div>
</div></div>

</body>

<script>
//date picker to choose start date and end dates
$( ".datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true
    });


// Hover states on the static widgets
$( "#dialog-link, #icons li" ).hover(
	function() {
		$( this ).addClass( "ui-state-hover" );
	},
	function() {
		$( this ).removeClass( "ui-state-hover" );
	}
);
</script>
</html>
