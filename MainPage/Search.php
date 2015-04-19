

<?php
 
session_start();
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
	};
 
?> 
 

 <!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Search</title>
<meta name="keywords" content="search">
<link href="stylesheet_main.css" rel="stylesheet" type="text/css" >
</head>
<header>
<div class="topbar">
  <div class="navbutton">
    <nav>
         	<a class="HomePage" href="/posterprofile/Update_Resume.php">Portfolio</a>
            <a href = "../../login/logout.php">Log out of [<b><?php echo "". $_SESSION['login_user'];?>]</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- topbar -->

<body>



<div class="sidebar">
  <h1>Job Search</h1>
  <div class="navbutton">
    <nav>
      <a class="HomePage" href="Main_Page.php">Main Page</a>
      <a class="HomePage">Search</a>
      <a class="HomePage" href="Manage_Application.php">Manage Applications</a>
    </nav>
  </div>
  <!-- navbutton --> 
</div>
<!-- sidebar -->

</header>

<!--mli modifications-->
<div class="content" id = "centered_inputs" align="center">
<form method="post" action="search_results.php" name="send">
  <h2>Search Criteria:</h2><br>
  
  <label>
  <a>Company Name:</a>
  <input type="text" name="company" size="20" id="company">
  </label>
  <br>
 
  <label>
   <a>Minimum Salary:</a>
   <select name="salary" id="salary">
   <!-- loop to create salary list -->
    <?php 
	for ($i = 1; $i <= 25; $i++) : 
		$j = $i*10000;
       echo "<option value=".$j.">$".$j."</option>";
    endfor; 
	?>
   </select>
  </label> <br>
  
  <label>
  <a>Job Title：</a>
  <input name="jobname" type="text" id="jobname">
  </label>
  <br>
  
  <label>
  <a>State：</a>
  
		<?php
		function statesList() {
			$states = array('AL'=>"Alabama",
							'AK'=>"Alaska",
							'AZ'=>"Arizona",
							'AR'=>"Arkansas",
							'CA'=>"California",
							'CO'=>"Colorado",
							'CT'=>"Connecticut",
							'DE'=>"Delaware",
							'DC'=>"District Of Columbia",
							'FL'=>"Florida",
							'GA'=>"Georgia",
							'HI'=>"Hawaii",
							'ID'=>"Idaho",
							'IL'=>"Illinois",
							'IN'=>"Indiana",
							'IA'=>"Iowa",
							'KS'=>"Kansas",
							'KY'=>"Kentucky",
							'LA'=>"Louisiana",
							'ME'=>"Maine",
							'MD'=>"Maryland",
							'MA'=>"Massachusetts",
							'MI'=>"Michigan",
							'MN'=>"Minnesota",
							'MS'=>"Mississippi",
							'MO'=>"Missouri",
							'MT'=>"Montana",
							'NE'=>"Nebraska",
							'NV'=>"Nevada",
							'NH'=>"New Hampshire",
							'NJ'=>"New Jersey",
							'NM'=>"New Mexico",
							'NY'=>"New York",
							'NC'=>"North Carolina",
							'ND'=>"North Dakota",
							'OH'=>"Ohio",
							'OK'=>"Oklahoma",
							'OR'=>"Oregon",
							'PA'=>"Pennsylvania",
							'RI'=>"Rhode Island",
							'SC'=>"South Carolina",
							'SD'=>"South Dakota",
							'TN'=>"Tennessee",
							'TX'=>"Texas",
							'UT'=>"Utah",
							'VT'=>"Vermont",
							'VA'=>"Virginia",
							'WA'=>"Washington",
							'WV'=>"West Virginia",
							'WI'=>"Wisconsin",
							'WY'=>"Wyoming");
			return $states;
		}

		$states = statesList();
		?>
 <select name="state" >
        <option selected="selected">Any</option>
        <?php foreach($states as $key=>$value) { ?>
            <option value="<?php echo $value; ?>"><?php echo $value; ?></option>
        <?php } ?>
    </select>
</label>
  <br>
 <label>
  <br>
  <input class="button" type="submit" value="search" name="submitBtn" id="button">
  </label>
</form>
</div>
<!-- end mli mods-->
</body>

</html>
