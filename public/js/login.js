$(function () {
  window.Chan.Login = {}

  Chan.Login.main = function () {
    Chan.Login.eyes()
  }

  Chan.Login.eyes = function () {
    $('.login-user').click(function () {
      Chan.Login.user()
    })
  }

  Chan.Login.user = function () {
    $.ajax({
      url: "http://localhost:3000/api/auth/login",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      data: JSON.stringify({ username: $('.username').val(), password: $('.password').val() }),
      success: function (data) {
        console.log(data)
      },
      error: function () {
        console.log("error")
      }
    })
  }

  // get it started
  Chan.Login.main()
})