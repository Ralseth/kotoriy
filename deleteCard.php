<?php 
	session_start();

	function findById() {
		foreach ($_SESSION['cart'] as $key => $value) {
			if ($value['id'] == $_GET['id']){
				return $key;
			}
		}
	}


	if (!isset($_GET['id'])) {
		unset($_SESSION['cart']);
	} else {
		$key = findById();
		if($_SESSION['cart'][$key]['count'] > 1) {
		$_SESSION['cart'][$key]['count'] -= 1;
		} else {
			unset($_SESSION['cart'][$key]);
		}
	}

	if($_GET['from'] == "index") {
		header("location: index.php");
	} elseif ($_GET['from'] == "cloth") {
		header("location: cloth.php");
	} elseif ($_GET['from'] == "furniture") {
		header("location: furniture.php");
	} elseif ($_GET['from'] == "office") {
		header("location: office.php");
	} elseif ($_GET['from'] == "product") {
		header("location: product.php");
	}

	exit();
	


?>