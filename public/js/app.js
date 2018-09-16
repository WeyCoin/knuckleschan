$(function() {
  const bcrypt = dcodeIO.bcrypt;

  window.Chan = {}
  window.Chan.Validator = {}
  window.Chan.Password = {}

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

  Chan.Password.hash = function(password) {
    return bcrypt.hashSync(password)
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