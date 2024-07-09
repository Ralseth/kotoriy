<?php
session_start(); // Начинаем сессию

// Удаляем данные сессии
unset($_SESSION['username']);

// Уничтожаем сессию
session_destroy();

// Перенаправляем пользователя обратно на главную страницу или страницу входа
header("Location: index.php");
exit();

