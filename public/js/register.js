$(function() {
  window.Chan.Register = {}

  Chan.Register.main = function() {
    Chan.Register.eyes()

    // pre gen a seed for user visiting registration page
    const seed = Chan.createSeed()
    const seedHex = Chan.seedToHex(seed)
    const seedWords = Chan.seedToWords(seed)
    
    $(".seed").text(seedWords)
  }

  Chan.Register.eyes = function() {
    $('.register-user').click(function() {
      console.log($('.username').val())
      console.log($('.seed').html())

      Chan.Validator.username($('.username').val())
    })
  }
  
  // get it started
  Chan.Register.main()
})