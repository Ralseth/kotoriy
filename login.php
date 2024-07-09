<?php
	$mysql = new mysqli("MySQL-8.0", "root", "", "nnmarket");
  	$mysql->query("SET NAMES 'utf8'");

  	if ($mysql->connect_error){
    	echo "Error: ".$mysql->connect_error;
  	}
    session_start();

    function test_input($data) {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }

	if($_POST['login']) {
        $username = test_input($_POST['username']);
        $password = md5(test_input($_POST['password']));
        $accounts = [];
        $limitation = $mysql->query("SELECT * from accounts WHERE username='$username' limit 1;");

        while ($row = mysqli_fetch_assoc($limitation)){
            $accounts[] = array(
            "username" => $row["username"], 
            "password" => $row["password"],
            );
        }

        if (count($accounts) > 0) {
            if ($accounts[0]["password"] == $password) {
                unset($_SESSION["AUTH_ERR"]);
                $_SESSION['username'] = $username;
            } else {
                $_SESSION["AUTH_ERR"] = 3;
            }
        } else {
            $_SESSION["AUTH_ERR"] = 2;
        }

        header("location: index.php");
	}
   
