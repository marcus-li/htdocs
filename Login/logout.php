<?php
session_start();
if(session_destroy()) // Destroying All Sessions
{
header("Location: login_main.php"); // Redirecting To Home Page
}
?>