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

  Chan.createSeed = function(bit=96) {
    return new Mnemonic(bit);
  }

  Chan.seedToHex = function(seed) {
    return seed.toHex()
  }

  Chan.seedToWords = function(seed) {
    return seed.toWords()
  }

  Chan.Validator.username = function(username) {
    console.log(username)
    console.log(Config.rules.username.length)
    
    if (Config.rules.username.allow.test(username) || username.length < Config.rules.username.length) {
      console.log('Invalid username');
    } else {
      console.log('Valid username');
    }
  }

  // get it started
  Chan.main()
})