<?php

    session_start();

    $mysql = new mysqli("MySQL-8.0", "root", "", "nnmarket");
    $mysql->query("SET NAMES 'utf8'");

    if ($mysql->connect_error) {
        echo "Error: " . $mysql->connect_error;
        exit();
    }

    // Функция для переноса данных из корзины в заказы
    function moveToOrders() {
        global $mysql;
        // Проверяем, есть ли товары в корзине
        if (isset($_SESSION['cart']) && !empty($_SESSION['cart'])) {
            // Определяем, какой логин использовать
            $user = isset($_SESSION['username']) ? $_SESSION['username'] : 'user';

            // Переносим товары из корзины в заказы
            foreach ($_SESSION['cart'] as $item) {
              $query = "INSERT INTO orders (user, img, name, price, count) VALUES (?, ?, ?, ?, ?)";
              $stmt = $mysql->prepare($query);
              $stmt->bind_param("sssdi", $user, $item['img'], $item['name'], $item['price'], $item['count']);
              $stmt->execute();
            }
            // Очищаем корзину
            $_SESSION['cart'] = [];
        }
    }

    // Пример обработки формы оформления заказа
    if (isset($_POST['button-sub'])) {
        moveToOrders();
        // Перенаправляем пользователя на страницу заказов после оформления
        header("location: electronic.php");
        exit();
    }
?>