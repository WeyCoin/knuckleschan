$(function() {
  window.Chan.Register = {}

  Chan.Register.main = function() {
    Chan.Register.eyes()

    // pre gen a seed for user visiting registration page
    Chan.Register.seed = Chan.createSeed()
    Chan.Register.seedHex = Chan.seedToHex(Chan.Register.seed)
    Chan.Register.seedWords = Chan.seedToWords(Chan.Register.seed)
    
    $(".seed").text(Chan.Register.seedWords)
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
      data: JSON.stringify({ username: $('.username').val(), hex: Chan.Register.seedHex }),
      success: function() {
        console.log("success")
      },
      error: function() {
        console.log("error")
      }
    })
  }
  
  // get it started
  Chan.Register.main()
})