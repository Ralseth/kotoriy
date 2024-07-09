<?php
  session_start();
  
  $mysql = new mysqli("MySQL-8.0", "root", "", "nnmarket");
  $mysql->query("SET NAMES 'utf8'");
  
  if ($mysql->connect_error){
    echo "Error: ".$mysql->connect_error;
    exit();
  }

  $isLoggedIn = isset($_SESSION['username']) && !empty($_SESSION['username']);
  $logoutUrl = $isLoggedIn ? 'logout.php' : '#';
  $iconClass = $isLoggedIn ? 'fa-sign-out-alt' : 'fa-user';
  $allPrdct = [];
  $result = $mysql->query('SELECT * from allproducts WHERE type = "popular"');
  while ($row = mysqli_fetch_assoc($result)){
    $allPrdct[] = array(
      "id" => $row["id"],
      "img" => $row["img"], 
      "price" => $row["price"],
      "name" => $row["name"],
      "rating" => $row["rating"],
    );
  }

  // Выполняем SQL запрос для выборки данных из таблицы заказов
  $query = "SELECT * FROM orders WHERE user = ?";
  $stmt = $mysql->prepare($query);
  $stmt->bind_param("s", $_SESSION['username']); // Предполагаем, что есть сессия с именем пользователя
  $stmt->execute();
  $result = $stmt->get_result();

  // Обрабатываем результаты запроса
  $orders = [];
  while ($row = $result->fetch_assoc()) {
      $orders[] = $row;
  }
  
  $summ = 0;
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Anta&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <link href="styles/style.css" rel="stylesheet">
    <link href="styles/header.css" rel="stylesheet">
    <link href="styles/main.css" rel="stylesheet">
    <link href="styles/login.css" rel="stylesheet" >
    <link href="styles/footer.css" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <?php
    if (isset($_SESSION['theme']) && $_SESSION['theme'] === 'dark') {
      echo '<link href="styles/dark-theme.css" rel="stylesheet" id="theme-link">';
      $switchState = 'light'; // Устанавливаем состояние переключателя
      } else {
      echo '<link href="styles/light-theme.css" rel="stylesheet" id="theme-link">';
      $switchState = 'dark'; // Устанавливаем состояние переключателя
    } ?>
    <link href="img/icon.png" rel="icon">
    <title>KOTORIY</title>
</head>
<body>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
      var switchState = '<?php echo $switchState; ?>'; // Получаем состояние переключателя из PHP
      var themeSwitch = document.querySelector('.theme-check');
      themeSwitch.checked = switchState === 'dark'; // Устанавливаем состояние переключателя
  });
  </script>
  <div class="wrapper">
    <header class="header">
      <nav class="navbar navbar-expand-xxl bg-body-tertiary">
        <div class="container-fluid">
          <a class="navbar-brand active" href="index.php">KOTORIY</a>
          <div class="personal-blog">
            <a href="#" class="pers-icon" data-bs-toggle="popover" data-bs-trigger="hover" data-bs-placement="bottom" data-bs-html="true" data-bs-delay='{"show":0,"hide":1000}' data-bs-content="<?php echo $isLoggedIn ? "<a href='#' class='personal-btn btn btn-info'>Личный кабинет</a>" : 'Войдите, чтобы делать покупки'; ?>">
              <i class="fa-solid <?= $isLoggedIn ? 'fa-sign-out-alt' : 'fa-user' ?> fa-xl"></i>
              <span><?= $isLoggedIn ? $_SESSION['username'] : 'Войти' ?></span>
            </a>
            <a href="#" class="pers-icon" data-bs-toggle="modal" data-bs-target="#ordersModal"><i class="fa-solid fa-dolly fa-xl"></i><span>Заказы</span></a>
            <a href="#" class="pers-icon" data-bs-toggle="modal" data-bs-target="#basketModal"><i class="fa-solid fa-basket-shopping fa-xl"></i><span>Корзина</span></a>
            <a href="#" class="pers-icon theme">
              <input type="checkbox" class="theme-check">
              <i class="fa-solid fa-moon fa-xl moon"></i>
              <i class="fa-solid fa-sun fa-xl sun"></i>
              <span>Тема</span>
            </a>
          </div>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Переключатель навигации">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <form class="d-flex col-lg-6" role="search">
              <input class="form-control me-2" type="search" placeholder="Поиск" aria-label="Поиск">
              <button class="btn btn-outline-success" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" href="electronic.php">Электроника</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="cloth.php">Одежда</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="furniture.php">Мебель</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="office.php">Канцелярия</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="product.php">Продукты</a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </header>

    <main class="main">
      <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="img/slide1.webp" class="d-block w-100" alt="Первый слайд">
          </div>
          <div class="carousel-item">
            <img src="img/slide2.webp" class="d-block w-100" alt="Второй слайд">
          </div>
          <div class="carousel-item">
            <img src="img/slide3.webp" class="d-block w-100" alt="Третий слайд">
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true" style="background-color:grey; opacity: 0.7;"></span>
          <span class="visually-hidden">Предыдущий</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true" style="background-color:grey; opacity: 0.7;"></span>
          <span class="visually-hidden">Следующий</span>
        </button>
      </div>

      <div class="modal fade" id="basketModal" tabindex="-1" aria-labelledby="basketModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="basket-card">
              <div class="basket-header">Корзина</div>
              <hr>
              <div class="basket-item-container">
                <?php if (isset($_SESSION['cart'])): ?>
                  <?php foreach($_SESSION['cart'] as $key): ?>
                    <?php $summ += $key['count'] * $key['price']; ?>
                    <div class='basket-item'>
                      <img src='<?= $key['img']; ?>' class='imgBaskCard'>
                      <span class='textForName'><?= $key['name']; ?></span>
                      <a href="deleteCard.php?id=<?=$key['id'];?>&from=index"><div class="minus">-</div></a>
                      <span class='numInBask'><strong><?= $call = $key['count'];?></strong></span>
                      <a href="addToCard.php?id=<?=$key['id'];?>&from=index"><div class="plus">+</div></a>
                      <span class='price'><?= $call * $key['price'];?>₽</span>
                    </div>
                  <?php endforeach; ?>
                  <div class="basketSumm">Общая сумма: <?= $summ; ?>₽</div>
                <?php endif; ?>
              </div>
              <hr>
              <form class="basket-btn-container" method="post" action="addToOrders.php">
                <a href="deleteCard.php?from=index" class="btns">Очистить</a>
                <?php if (isset($_SESSION['username'])): ?>
                    <input type="submit" name="button-sub" class="btns" value="Оформить заказ">
                <?php else: ?>
                    <input type="submit" name="button-sub" class="btns" value="Оформить заказ" disabled>
                    <p class='please-log'>Чтобы оформить заказ, пожалуйста, войдите</a>.</p>
                <?php endif; ?>
              </form>
            </div>
          </div>
        </div>
      </div>

      <div class="modal fade" id="ordersModal" tabindex="-1" aria-labelledby="ordersModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
          <div class="order-card">
              <div class="basket-header">Заказы</div>
              <hr>
              <div class="basket-item-container">
                <div class="orders-list">
                  <?php if (empty($orders)): ?>
                    <p class="no-orders">У вас пока нет заказов.</p>
                    <?php else: ?>
                        <?php foreach ($orders as $order): ?>
                            <div class="order-item">
                                <img src="<?= $order['img']; ?>" alt="<?= $order['name']; ?> " class='imgBaskCard'>
                                <div class="order-details">
                                  <div class='textForName'><?= $order['name']; ?></div>
                                  <p class='price'>Цена:&nbsp;<?= $order['price']; ?>₽</p>
                                  <p class='numInBask'>Количество:&nbsp;<?= $order['count']; ?></p>
                                  <p class='order-status'>Статус:&nbsp;<span class='status-text'><?= $order['status']; ?></span></p> <!-- Выводим статус заказа -->
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php endif; ?>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="wrapper-log">
              <span class="bg-animate"></span>
              <span class="bg-animate2"></span>
              <div class="form-box login">
                  <h2 class="animation" style="--i:0; --j:21;">Вход</h2>
                  <form method = 'post' action="login.php">
                      <div class="input-box animation" style="--i:1; --j:22;">
                          <input type="text" name="username" required>
                          <label>Имя</label>
                          <i class='bx bxs-user'></i>
                      </div>
                      <div class="input-box animation" style="--i:2; --j:23;">
                          <input type="password" name="password" id="password" autocomplete="off" required>
                          <label>Пароль</label>
                          <i class='bx bxs-lock-alt' ></i>
                      </div>
                      <input type="submit" class="btn-log animation" name="login" value='Войти' style="--i:3; --j:24;">
                      <div class="logreg-link animation" style="--i:4; --j:25;">
                          <p>У вас нет учетной записи? 
                              <a href="#" class="register-link">Зарегистрироваться</a>
                          </p>
                      </div>
                  </form>
              </div>
              <div class="info-text login">
                  <h2 class="animation" style="--i:0; --j:20;">Привет!</h2>
                  <p class="animation" style="--i:1; --j:21;">Рад вас снова видеть.</p>
              </div>

              <div class="form-box register">
                  <h2 class="animation" style="--i:17; --j:0;">Регистрация</h2>
                  <form method = 'post' action="registration.php">
                      <div class="input-box animation" style="--i:18; --j:1;">
                          <input type="text" name="username" required>
                          <label>Имя</label>
                          <i class='bx bxs-user'></i>
                      </div>
                      <div class="input-box animation" style="--i:19; --j:2;">
                          <input type="text" name="email" required>
                          <label>Email</label>
                          <i class='bx bxs-envelope'></i>
                      </div>
                      <div class="input-box animation" style="--i:20; --j:3;">
                          <input type="password" name="password" required>
                          <label>Пароль</label>
                          <i class='bx bxs-lock-alt' ></i>
                      </div>
                      <input type="submit" class="btn-log animation" name= 'register' style="--i:21; --j:4;" value='Зарегистрироваться'>
                      <div class="logreg-link animation" style="--i:22; --j:5;">
                          <p>У вас уже есть учетная запись? 
                            <a href="#" class="login-link">Войти</a>
                          </p>
                      </div>
                  </form>
              </div>
              <div class="info-text register">
                  <h2 class="animation" style="--i:17; --j:0;">Добро пожаловать!</h2>
                  <p class="animation" style="--i:18; --j:1;">Надеемся, что вы у нас задержитесь.</p>
              </div>
          </div>
          </div>
        </div>
      </div>

      <div class="cards">
        <label class="title-cards">Популярное</label>
        <?php foreach ($allPrdct as $key): ?>

        <div class="card">
          <a href="#">
            <div class="card-img">
              <img src="<?= $key['img'];?>" class="card-img-top" alt="...">
            </div>
            <div class="card-body">
              <h5 class="card-title"><?= $key['price'];?> ₽</h5>
              <p class="card-text"><?= $key['name'];?></p>
              <div class="rating-result">
              <?= $key['rating'];?>
              </div>
            </div>
          </a>
          <a href = "addToCard.php?img=<?=$key['img'];?>&id=<?=$key['id'];?>&name=<?=$key['name'];?>&price=<?=$key['price'];?>&from=index" class="btn btn-buy">Купить</a>
        </div>
        <?php endforeach; ?>

        <label class="title-cards" style="margin-bottom: 1.4%;">Категории товаров</label>
        <div class="categories">
          <a href="electronic.php"><img class="categorie" src="img/electronic.webp" alt="" height="250px"></a>
          <a href="cloth.php"><img class="categorie" src="img/cloth.webp" alt="" height="250px"></a>
          <a href="furniture.php"><img class="categorie" src="img/furniture.webp" alt="" height="250px"></a>
          <a href="office.php"><img class="categorie" src="img/office.webp" alt="" height="250px"></a>
          <a href="product.php"><img class="categorie" src="img/products.webp" alt="" height="250px"></a>
        </div>
      </div>
    </main>
    <footer class="footer col-lg-12">
      <div class="footer-col col-lg-6">
        <h4>компания</h4>
        <ul>
          <li><a href="#">о нас</a></li>
          <li><a href="#">контакты</a></li>
          <li><a href="#">политика конфиденциальности</a></li>
          <li><a href="#">партнерская программа</a></li>
        </ul>
      </div>
      <div class="footer-col col-lg-6">
        <h4>помощь</h4>
        <ul>
          <li><a href="#">FAQ</a></li>
          <li><a href="#">оплата</a></li>
          <li><a href="#">доставка</a></li>
          <li><a href="#">возврат</a></li>
        </ul>
      </div>
      <div class="footer-col col-lg-6">
        <h4>навигация</h4>
        <ul>
          <li><a href="#">электроника</a></li>
          <li><a href="#">одежда</a></li>
          <li><a href="#">мебель</a></li>
          <li><a href="#">канцелярия</a></li>
          <li><a href="#">продукты</a></li>
        </ul>
      </div>
      <div class="footer-col col-lg-6">
        <h4>подписывайтесь</h4>
        <div class="social-links">
          <a href="#"><i class="fa-brands fa-facebook fa-2xl"></i></a>
          <a href="#"><i class="fab fa-twitter fa-2xl"></i></a>
          <a href="#"><i class="fab fa-instagram fa-2xl"></i></a>
          <a href="#"><i class="fab fa-linkedin-in fa-2xl"></i></a>
        </div>
      </div>
    </footer>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <?php if (isset($_SESSION["AUTH_ERR"])): ?>
  <script>
  Swal.fire({
      icon: 'error',
      title: 'Ошибка',
      text: '<?php
      switch($_SESSION["AUTH_ERR"]) {
        case 1:
          echo "Такой пользователь уже есть";
          unset($_SESSION["AUTH_ERR"]);
          break;
        case 2:
          echo "Такого пользователя не существует"; 
          unset($_SESSION["AUTH_ERR"]);
          break;
        case 3:
          echo "Пароль введен неправильно"; 
          unset($_SESSION["AUTH_ERR"]);
          break;
      }
      ?>',
      confirmButtonText: 'OK'
  })
  </script>
  <?php endif; ?>
  <script>
  document.addEventListener('DOMContentLoaded', function() {
      var loginIcon = document.querySelector('.pers-icon');
      var isLoggedIn = '<?php echo $isLoggedIn ? "true" : "false"; ?>';

      loginIcon.addEventListener('click', function(event) {
          if (isLoggedIn === "true") {
              // Если пользователь авторизован, перенаправляем на страницу выхода из системы
              window.location.href = 'logout.php';
          } else {
              // Если пользователь не авторизован, открываем модальное окно входа в систему
              var loginModal = new bootstrap.Modal(document.getElementById('loginModal'));
              loginModal.show();
          }
      });
  });
  </script>
</body>
</html>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/89ca4132be.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl)
    })
});
</script>
