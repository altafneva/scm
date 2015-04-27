<?php
	include("../includes/config.php");
	session_start();
	if(isset($_SESSION['retailer_login'])) {
		if($_SESSION['retailer_login'] == true) {
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
	<title> Retailer: Home </title>
	<link rel="stylesheet" href="../includes/main_style.css" />
</head>
<body>
	<?php
		include("../includes/header.inc.php");
		include("../includes/nav_retailer.inc.php");
		include("../includes/aside_retailer.inc.php");
	?>
	<section>
		
	</section>
	<?php
		include("../includes/footer.inc.php");
	?>
</body>
</html>