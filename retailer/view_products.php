<?php
	include("../includes/config.php");
	session_start();
	if(isset($_SESSION['admin_login']) || isset($_SESSION['retailer_login']) || isset($_SESSION['manufacturer_login'])) {
		//if($_SESSION['admin_login'] == true || $_SESSION['retailer_login'] == true || $_SESSION['manufacturer_login'] == true) {
			$query_selectProducts = "SELECT * FROM products,categories,unit WHERE products.pro_cat=categories.cat_id AND products.unit=unit.id ORDER BY pro_id";
			$result_selectProducts = mysqli_query($con,$query_selectProducts);
			if($_SERVER['REQUEST_METHOD'] == "POST") {
				if(isset($_POST['chkId'])) {
					$chkId = $_POST['chkId'];
					foreach($chkId as $id) {
						$query_deleteProduct = "DELETE FROM products WHERE pro_id='$id'";
						$result = mysqli_query($con,$query_deleteProduct);
					}
					if(!$result) {
						echo "<script> alert(\"There was some problems deleting products\"); </script>";
						header('Refresh:0');
					}
					else {
						echo "<script> alert(\"Products Deleted Successfully\"); </script>";
						header('Refresh:0');
					}
				}
			}
		}
		else {
			header('Location:../index.php');
		}
	//}
//	else {
//		header('Location:../index.php');
//	}
?>
<!DOCTYPE html>
<html>
<head>
	<title> View Products </title>
	<link rel="stylesheet" href="../includes/main_style.css" >
</head>
<body>
	<?php
		include("../includes/header.inc.php");
		include("../includes/nav_retailer.inc.php");
		include("../includes/aside_retailer.inc.php");
	?>
	<section>
		<h1>View Products</h1>
		<form action="" method="POST" class="form">
		<table class="table_displayData">
			<tr>
				<th> ID </th>
				<th> Name </th>
				<th> Price </th>
				<th> Unit </th>
				<th> Category </th>
			</tr>
			<?php $i=1; while($row_selectProducts = mysqli_fetch_array($result_selectProducts)) { ?>
			<tr>
				<td> <?php echo $row_selectProducts['pro_id']; ?> </td>
				<td> <?php echo $row_selectProducts['pro_name']; ?> </td>
				<td> <?php echo $row_selectProducts['pro_price']; ?> </td>
				<td> <?php echo $row_selectProducts['unit_name']; ?> </td>
				<td> <?php echo $row_selectProducts['cat_name']; ?> </td>
			</tr>
			<?php $i++; } ?>
		</table>
		</form>
	</section>
	<?php
		include("../includes/footer.inc.php");
	?>
</body>
</html>