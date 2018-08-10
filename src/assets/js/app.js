$(function() {
  window.Chan = {}

  Chan.main = function() {
    console.log("hello")
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

  // get it started
  Chan.main()
})