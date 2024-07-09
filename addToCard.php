<?php
	session_start();

	function findById() {
		foreach ($_SESSION['cart'] as $key => $value) {
			if ($value['id'] == $_GET['id']){
				return $key;
			}
		}
		return -1;
	}

	if (findById() != -1) {
		$key = findById();
		$_SESSION['cart'][$key]['count'] += 1;
	} else {
		$_SESSION['cart'][] = array(
		"id" => $_GET['id'],
		"name" => $_GET['name'],
		"price" => $_GET['price'],
		"img" => $_GET['img'],
		"count" => 1,
		);
	}

	if($_GET['from'] == "index") {
		header("location: index.php");
	} elseif($_GET["from"] == "electronic") {
		header("location: electronic.php");
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