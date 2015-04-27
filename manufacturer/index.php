<?php
	include("../includes/config.php");
	session_start();
	if(isset($_SESSION['manufacturer_login'])) {
		if($_SESSION['manufacturer_login'] == true) {
		}
		else {
			header('Location:../index.php');
		}
	}
	else {
		header('Location:../index.php');
	}
?>
<!DOCTYPE html>
<html>
<head>
	<title> Manufacturer: Home </title>
	<link rel="stylesheet" href="../includes/main_style.css" >
</head>
<body>
	<?php
		include("../includes/header.inc.php");
		include("../includes/nav_manufacturer.inc.php");
		include("../includes/aside_manufacturer.inc.php");
	?>
	<section>
	</section>
	<?php
		include("../includes/footer.inc.php");
	?>
</body>
</html>