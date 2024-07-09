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
    
	if($_POST['register']) {
        $username = test_input($_POST['username']);
        $email = test_input($_POST['email']);
        $password = md5(test_input($_POST['password']));
        $accounts = [];
        $nb = $mysql->query("SELECT * from accounts WHERE username='$username' or email='$email' limit 1;");
        while ($row = mysqli_fetch_assoc($nb)){
            $accounts[] = array(
            "username" => $row["username"], 
            "email" => $row["email"],
            );
        }
        if (count($accounts) > 0) {
            $_SESSION["AUTH_ERR"] = 1;
        } else {
            unset($_SESSION["AUTH_ERR"]); 
            $mysql->query("INSERT INTO  `accounts` (`username`, `email`, `password`) VALUES('".$username."', '".$email."', '".$password."')");
        }
        
        header("location: index.php");
	}
