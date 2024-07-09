const wrapperLog = document.querySelector('.wrapper-log');
const registerLink = document.querySelector('.register-link');
const loginLink = document.querySelector('.login-link');

registerLink.onclick = () => {
  wrapperLog.classList.add('active');
}

loginLink.onclick = () => {
  wrapperLog.classList.remove('active');
}

const theme = document.querySelector(".theme");
const themes = document.querySelector("#theme-link");

theme.addEventListener("click", function() {
  var theme = themes.getAttribute("href") == "styles/light-theme.css" ? "dark" : "light";
  var switchState = theme == "dark" ? "light" : "dark"; // Определяем состояние переключателя
  themes.href = theme == "dark" ? "styles/dark-theme.css" : "styles/light-theme.css";

  // Отправляем AJAX запрос на сервер
  fetch('save_theme.php', {
      method: 'POST',
      headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'theme=' + encodeURIComponent(theme) + '&switchState=' + encodeURIComponent(switchState),
  });
});



