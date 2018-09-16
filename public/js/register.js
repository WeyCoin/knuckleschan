$(function() {
  window.Chan.Register = {}

  Chan.Register.main = function() {
    Chan.Register.eyes()
  }

  Chan.Register.eyes = function() {
    $('.register-user').click(function() {
      Chan.Validator.username($('.username').val())
    })
  }

  Chan.Register.newUser = function() {
    $.ajax({
      url: "http://localhost:3000/api/auth/register",
      type: "POST",
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      data: JSON.stringify({ username: $('.username').val(), password: Chan.Password.hash($('.password').val()) }),
      success: function(data) {
        console.log(data)
      },
      error: function() {
        console.log("error")
      }
    })
  }
  
  // get it started
  Chan.Register.main()
})