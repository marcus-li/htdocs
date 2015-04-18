<?php
session_start();
if(session_destroy()) // Destroying All Sessions
{
if (!empty($_SERVER['HTTPS']) && ('on' == $_SERVER['HTTPS'])) {
		$uri = 'https://';
	} else {
		$uri = 'http://';
	}
	$uri .= $_SERVER['HTTP_HOST'];
	header('Location: '.$uri.'/login/login_main.php');
	exit;
}
?>