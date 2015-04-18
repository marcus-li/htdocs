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
         	<a class="HomePage" href="Update_Resume.php">Portfolio</a>
            <a href = "../login/logout.php">Log out</a>
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
<div class="frame" align="center">
<form method="post" action="<?php $_PHP_SELF ?>" name="send" onSubmit="return Check()">
  <h2>Account Information:</h2><br>
   <label><a>UserID:</a>
  <input type="text" name="UserName" size="20" id="UserName" class="c3a">
  <a id="status"></a></label>
  <br>
 
  <label>
   <a>Email:</a>
    <input name="UserEmail" type="email" id="UserEmail" placeholder="example@abc.com">
  </label> <br>
  
  <label>
  <a>Password：</a>
  <input name="password" type="password" id="password">
  </label><br>
  
  <label>
  <a>Password Confirm：</a>
  <input name="UserPassword" type="password" id="UserPassword">
  </label><br>
  <br>
  
  
  <h2>Personal Information:</h2><br>
  <a>First Name：</a>
  <input type="text" name="UserFirstName" size="20" id="UserFirstName" class="c3a" placeholder="firstname">
  <br>
  <a>Last Name：</a>
  <input type="text" name="UserLastName" size="20" id="UserLastName" class="c3a" placeholder="lastname">
  <br>
  <a>Phone Number：</a>
  <input type="tel" name="UserPhone" size="20" id="UserPhone" class="c3a" placeholder="(xxx)xxx-xxxx">
  <br>
  <input type="tel" class="cell" name="UserCell" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  (optional) <br>
  <a>Address：</a>
  <input type="text" name="UserAddress1" size="20" class="c3a" placeholder="address line 1">
  <br>
  <input type="text" class="addr2" name="UserAddress2" size="20" class="c3a" placeholder="address line 2">
  (optional) <br>
  <a>City：</a>
  <input type="text" name="UserCity" size="20" class="c3a" placeholder="city">
  <br>
  <a>Zipcode：</a>
  <input type="text" name="UserZip" size="20" class="c3a" placeholder="00000">
  <br>
  <a>States:</a>
  <select name="UserState" id="UserState">
    <option value="">Please select</option>
    <option value="Alabama">Alabama</option>
    <option value="Alaska">Alaska</option>
    <option value="Arizaona">Arizaona</option>
    <option value="Arkansas">Arkansas</option>
    <option value="California">California</option>
    <option value="Colorado">Colorado</option>
    <option value="Connecticut">Connecticut</option>
    <option value="Delaware">Delaware</option>
    <option value="District of Columbia">District of Columbia</option>
    <option value="Florida">Florida</option>
    <option value="Georgia">Georgia</option>
    <option value="Hawaii">Hawaii</option>
    <option value="Idaho">Idaho</option>
    <option value="Illinois">Illinois</option>
    <option value="Indiana">Indiana</option>
    <option value="Iowa">Iowa</option>
    <option value="Kansas">Kansas</option>
    <option value="Kentucky">Kentucky</option>
    <option value="Louisiana">Louisiana</option>
    <option value="Maine">Maine</option>
    <option value="Maryland">Maryland</option>
    <option value="Massachusetts">Massachusetts</option>
    <option value="Michigan">Michigan</option>
    <option value="Minnesota">Minnesota</option>
    <option value="Mississippi">Mississippi</option>
    <option value="Missouri">Missouri</option>
    <option value="Montana">Montana</option>
    <option value="Nebraska">Nebraska</option>
    <option value="Nevada">Nevada</option>
    <option value="ew Hampshire">New Hampshire</option>
    <option value="New Jersey">New Jersey</option>
    <option value="New Mexico">New Mexico</option>
    <option value="New York">New York</option>
    <option value="North Carolina">North Carolina</option>
    <option value="North Dakota">North Dakota</option>
    <option value="Ohio">Ohio</option>
    <option value="Oklahoma">Oklahoma</option>
    <option value="Oregon">Oregon</option>
    <option value="Pennsylvania">Pennsylvania</option>
    <option value="Puerto Rico">Puerto Rico</option>
    <option value="Rhode Island">Rhode Island</option>
    <option value="South Carolina">South Carolina</option>
    <option value="South Dakota">South Dakota</option>
    <option value="Tennessee">Tennessee</option>
    <option value="Texas">Texas</option>
    <option value="Utah">Utah</option>
    <option value="Vermont">Vermont</option>
    <option value="Virgin Islands">Virgin Islands</option>
    <option value="Virginia">Virginia</option>
    <option value="Washington">Washington</option>
    <option value="West Virginia">West Virginia</option>
    <option value="Wisconsin">Wisconsin</option>
    <option value="Wyoming">Wyoming</option>
  </select> 
  <br>
  <a>Fax: </a>
  <input type="tel" name="fax" size="20" class="c3a" placeholder="(xxx)xxx-xxxx">
  (optional) <br>
  <a>Home Page: </a>
  <input type="tel" name="homepage" size="20" class="c3a">
  (optional) <br>
  <br>
  <input class="button" type="submit" value="Submit" name="submit" id="button">
  <input class="button" type="reset" value="redo">
</form>
</div>
<!-- end mli mods-->
</body>

</html>
