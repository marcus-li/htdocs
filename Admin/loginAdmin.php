
<?php session_start();

$_SESSION['login_user'] = 'admin';

			header('Location: admin.php');
		?>
