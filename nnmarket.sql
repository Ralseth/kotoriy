-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.0
-- Время создания: Июн 14 2024 г., 03:57
-- Версия сервера: 8.0.35
-- Версия PHP: 8.1.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `nnmarket`
--

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `id` int NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `accounts`
--

INSERT INTO `accounts` (`id`, `username`, `email`, `password`) VALUES
(9, 'Мурад', 'auririn6161@mail.ru', '81dc9bdb52d04dc20036dbd8313ed055'),
(10, 'Имя', 'auririn6161@mail.ru3', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Структура таблицы `allproducts`
--

CREATE TABLE `allproducts` (
  `id` int NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `rating` text COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `allproducts`
--

INSERT INTO `allproducts` (`id`, `img`, `price`, `name`, `rating`, `type`) VALUES
(1, 'img/snickersmini.webp', 1500, 'Шоколадные конфеты Snickers Minis, Молочный шоколад, Арахис, Нуга, Карамель, Коробка, 1кг', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> <div style=\'color:grey;\'>363</div>', 'popular'),
(2, 'img/rondellvintage.webp', 8899, 'Набор кастрюль Rondell Vintage 6 шт.', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>93</div>', 'popular'),
(3, 'img/zone51invader.webp', 14990, 'Кресло компьютерное игровое ZONE 51 INVADER Blue', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>49</div>', 'popular'),
(4, 'img/autoshamp.webp', 1429, 'Автошампунь для бесконтактной мойки GRASS Active Foam Pink, 6 кг', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>178</div>', 'popular'),
(5, 'img/tuf4090.webp', 149000, 'Видеокарта ASUS NVIDIA GeForce RTX 4090 TUF Gaming OC Edition (90YV0IE0-M0NA00)', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span></span>\r\n<div style=\'color:grey;\'>17</div>', 'popular'),
(6, 'img/adidassuperstar.webp', 12199, 'Кеды мужские Adidas Superstar черные', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>7</div>', 'popular'),
(7, 'img/backpackunicorn.webp', 699, 'Рюкзак школьный 42 см, Единороги', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>2755</div>', 'popular'),
(8, 'img/tablesetluminarc.webp', 1870, 'Столовый набор посуды Luminarc Louis XV 16 предметов', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>64</div>', 'popular'),
(9, 'img/utygtefal.webp', 4029, 'Утюг Tefal FV5735E0 синий, белый', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span></span> \r\n<div style=\'color:grey;\'>232</div>', 'popular'),
(10, 'img/stulflexvelyr.webp', 15000, 'Стул для кухни обеденный Флекс велюр серый (комплект 4 стула)', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>67</div>', 'popular'),
(11, 'img/tolstovkacalvinklein.webp', 6500, 'Толстовка мужская Calvin Klein 40HM259 бежевая L', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>12</div>', 'popular'),
(12, 'img/logitechh540.webp', 2400, 'Гарнитура Logitech H540 Black', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span></span> <div style=\'color:grey;\'>14</div>', 'popular'),
(13, 'img/iphone14prmx.webp', 85000, 'Смартфон Apple iPhone 14 Pro Max 256 Гб, eSIM + nano-sim, Space Black', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span></span>\r\n<div style=\'color:grey;\'>124</div>', 'electronic'),
(14, 'img/galaxys24.webp', 65000, 'Смартфон Samsung Galaxy S24 5G 8/128Gb черный оникс', '<span class=\"active-rate\"></span>	\r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>  \r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>\r\n                <div style=\'color:grey;\'>65</div>', 'electronic'),
(15, 'img/qyronsi602.webp', 1990, 'Утюг QYRON SI602 черный', '<span class=\"active-rate\"></span>	\r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>  \r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>\r\n                <div style=\'color:grey;\'>3</div>', 'electronic'),
(16, 'img/vacuums10.webp', 16000, 'Робот-пылесос Xiaomi Robot Vacuum S10 B106GL белый', '<span class=\"active-rate\"></span>	\r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>  \r\n                <span class=\"active-rate\"></span>    \r\n                <span></span>\r\n                <div style=\'color:grey;\'>23</div>', 'electronic'),
(17, 'img/samsungue50cu.webp', 120000, 'Телевизор Samsung UE50CU7100UXRU, 50 (127 см), UHD 4K', '<span class=\"active-rate\"></span>	\r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>  \r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>\r\n                <div style=\'color:grey;\'>89</div>', 'electronic'),
(18, 'img/kitfortkt1354.webp', 9000, 'Миксер Kitfort KT-1354 Red', '<span class=\"active-rate\"></span>	\r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>  \r\n                <span class=\"active-rate\"></span>    \r\n                <span class=\"active-rate\"></span>\r\n                <div style=\'color:grey;\'>56</div>', 'electronic'),
(19, 'img/psdmchndelvento.webp', 14490, 'Посудомоечная машина DELVENTO VWP670160 белая', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>24</div>', 'electronic'),
(20, 'img/tosterkitfort.webp', 1990, 'Тостер Kitfort КТ-6221 серебристый', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>17</div>', 'electronic'),
(21, 'img/sbersdxtele.webp', 19960, 'Телевизор Sber SDX-55U4127 55(139 см) UHD 4K', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>86</div>', 'electronic'),
(22, 'img/pilesostefal.webp', 23290, 'Пылесос Tefal ручной с функцией влажной уборки, TY9890WO, серый, синий', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span></span>    \r\n<span></span>\r\n<div style=\'color:grey;\'>2</div>', 'electronic'),
(23, 'img/multivarkapolaris.webp', 6199, 'Мультиварка Polaris PMC 0526 IQ Home', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span></span>\r\n<div style=\'color:grey;\'>2</div>', 'electronic'),
(24, 'img/massajernog.webp', 7290, 'Массажер для ног Planta MF-6B Шиацу', '<span class=\"active-rate\"></span>	\r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>  \r\n<span class=\"active-rate\"></span>    \r\n<span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>122</div>', 'electronic'),
(25, 'img/shirtmaisondavid.webp', 4490, 'Рубашка мужская Maison David', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span></span> \r\n<div style=\'color:grey;\'>4</div>', 'cloth'),
(26, 'img/dressgerryweber.webp', 7330, 'Платье женское Gerry Weber', '<span></span>	 \r\n<span></span>     \r\n<span></span>   \r\n<span></span>\r\n<span></span> \r\n<div style=\'color:grey;\'>0</div>', 'cloth'),
(27, 'img/jeanscolins.webp', 3650, 'Джинсы мужские Colins', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>126</div>', 'cloth'),
(28, 'img/bootsclarks.webp', 8799, 'Ботинки мужские Clarks', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>5</div>', 'cloth'),
(29, 'img/bootsmakfine.webp', 5199, 'Ботильоны женские MAKFINE черные', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>8</div>', 'cloth'),
(30, 'img/bagmichaelkors.webp', 18740, 'Сумка кросс-боди женская Michael Kors', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>2</div>', 'cloth'),
(31, 'img/jacketmcstyles.webp', 1640, 'Куртка Mcstyles для мальчиков', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>201</div>', 'cloth'),
(32, 'img/blouseyiwu.webp', 700, 'Блузка детская Yiwu Xflot Supply Chain', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>16</div>', 'cloth'),
(33, 'img/cardiganovs.webp', 1300, 'Кардиган OVS для мальчиков', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>10</div>', 'cloth'),
(34, 'img/overallsbatik.webp', 1490, 'Комбинезон детский Batik', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>24</div>', 'cloth'),
(35, 'img/dresshappybaby.webp', 790, 'Платье Веселый малыш Le Fleur', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>98</div>', 'cloth'),
(36, 'img/clockemporioarmani.webp', 8200, 'Наручные часы кварцевые мужские Emporio Armani', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>\r\n<div style=\'color:grey;\'>37</div>', 'cloth'),
(37, 'img/zombieviking.webp', 15400, 'Кресло игровое ZOMBIE VIKING KNIGHT', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>339</div>', 'furniture'),
(38, 'img/podushkadarwinfresh.webp', 1600, 'Подушка ортопедическая Darwin Fresh 3.0', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>724</div>', 'furniture'),
(39, 'img/raskladushkaleset.webp', 4400, 'Раскладушка Leset 201', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>144</div>', 'furniture'),
(40, 'img/komodventalhk.webp', 6500, 'Комод Вентал НК-4', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>67</div>', 'furniture'),
(41, 'img/osnovaniedreamline.webp', 6500, 'Основание кроватное DreamLine Dream 160х200', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>35</div>', 'furniture'),
(42, 'img/taburetnika.webp', 850, 'Табурет Nika', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>48</div>', 'furniture'),
(43, 'img/komplektuno.webp', 5700, 'Комплект стульев Uno 25 опора конус 2 шт', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>332</div>', 'furniture'),
(44, 'img/stoledwardloft.webp', 6850, 'Стол письменный Edward loft 140x60x75 см', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>77</div>', 'furniture'),
(45, 'img/komodlogikakvazar.webp', 4340, 'Комод УЮТНАЯ ЛОГИКА Квазар', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>91</div>', 'furniture'),
(46, 'img/zhurnalniystolglassd55.webp', 1600, 'Журнальный стол Glass D55', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \n<div style=\'color:grey;\'>124</div>', 'furniture'),
(47, 'img/veshalkadly.webp', 89, 'Вешалка для брюк и юбок «Змейка»', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>124</div>', 'furniture'),
(48, 'img/penaluytnayalogikadeva.webp', 5200, 'Пенал Уютная Логика Дева', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>124</div>', 'furniture'),
(49, 'img/ruchkaerichkrauseorange.webp', 60, 'Ручка шариковая ErichKrause Orange 3 шт', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>184</div>', 'office'),
(50, 'img/ruchkaerichkrause.webp', 40, 'Ручка шариковая ErichKrause синяя', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>79</div>', 'office'),
(51, 'img/bumagasvetocopy.webp', 300, 'Бумага для принтера SvetoCopy 500 л', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>998</div>', 'office'),
(52, 'img/correctlent.webp', 55, 'Корректирующая лента BRAUBERG', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>374</div>', 'office'),
(53, 'img/naborruchekgelevih.webp', 140, 'Ручки гелевые НАБОР 12шт АССОРТИ НЕОН', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>220</div>', 'office'),
(54, 'img/sketchbook.webp', 120, 'Скетчбук 30л BRAUBERG ART', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>41</div>', 'office'),
(55, 'img/kleykarandash.webp', 58, 'Клей-карандаш ErichKrause', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>268</div>', 'office'),
(56, 'img/probkovayadoska.webp', 1200, 'Доска пробковая 60х90см', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>50</div>', 'office'),
(57, 'img/tainayaoporabook.webp', 300, 'Тайная Опора: привязанность В Жизни Ребенка', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>146</div>', 'office'),
(58, 'img/nastolgamehasbro.webp', 700, 'Настольная игра Hasbro Gaming Monopoly Ultimate', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"\"></span> \r\n<div style=\'color:grey;\'>65</div>', 'office'),
(59, 'img/akvareljovi.webp', 450, 'Акварель Jovi 24 цвета', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>37</div>', 'office'),
(60, 'img/tetradlorex.webp', 160, 'Тетрадь Lorex Neon Coctail Kittens 120 л', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>71</div>', 'office'),
(97, 'img/ogurcivegda.webp', 340, 'Огурцы Vegda product соленые 580г', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>98</div>', 'food'),
(98, 'img/maslopodsolnechnoeblago.webp', 110, 'Масло подсолнечное рафинированное дезодорированное Благо 1 л', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>997</div>', 'food'),
(99, 'img/hlebniepalochkinutella.webp', 90, 'Хлебные палочки Nutella', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>666</div>', 'food'),
(100, 'img/kinderbueno.webp', 55, 'Kinder Bueno белый шоколад', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>555</div>', 'food'),
(101, 'img/kinderchocolate.webp', 110, 'Шоколад Kinder с молочной начинкой', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \n<div style=\'color:grey;\'>1777</div>', 'food'),
(102, 'img/krevetkipolar.webp', 710, 'Креветки Polar замороженные без заправки 500 гр', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>289</div>', 'food'),
(103, 'img/marmeladfruittella.webp', 50, 'Мармелад жевательный Fruit-tella змеи xxl с фруктовым соком 70 г', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>777</div>', 'food'),
(104, 'img/nanoptipro.webp', 680, 'Молочная смесь NAN Optipro 3 от года 400 г', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>322</div>', 'food'),
(105, 'img/sgushenkakorovka.webp', 140, 'Сгущенное молоко Коровка из кореновки с сахаром 8,5% БЗМЖ 360 г', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>1046</div>', 'food'),
(106, 'img/coffeelavazza.webp', 1070, 'Кофе в зернах Lavazza qualita oro 1000 г', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>1046</div>', 'food'),
(107, 'img/kartofeleconom.webp', 12, 'Картофель эконом 1 кг', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>4444</div>', 'food'),
(108, 'img/lukeconom.webp', 27, 'Лук Эконом 1 кг', '<span class=\"active-rate\"></span>	 <span class=\"active-rate\"></span>     <span class=\"active-rate\"></span>   \r\n<span class=\"active-rate\"></span>     <span class=\"active-rate\"></span> \r\n<div style=\'color:grey;\'>2223</div>', 'food');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Новый',
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `allproducts`
--
ALTER TABLE `allproducts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `allproducts`
--
ALTER TABLE `allproducts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
