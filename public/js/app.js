$(function() {
  window.Chan = {}
  window.Chan.Validator = {}

  const Config = {
    rules: {
      username: {
        allow: /^\W+$/, // allows letters, numbers, and underscores
        length: 6
      }
    }
  }

  Chan.main = function() {
    
  }

  Chan.Validator.username = function(username) {
    if (Config.rules.username.allow.test(username) || username.length < Config.rules.username.length) {
      console.log('Invalid username');
    } else {
      Chan.Register.newUser()
    }
  }

  // get it started
  Chan.main()
})