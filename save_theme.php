<?php
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $theme = $_POST['theme'];
    $switchState = $_POST['switchState']; // Добавляем состояние переключателя
    $_SESSION['theme'] = $theme;
    $_SESSION['switchState'] = $switchState; // Сохраняем состояние переключателя
    echo 'Theme saved: ' . $theme;
}
