$(function() {
  window.Chan.Register = {}

  Chan.Register.main = function() {
    // pre gen a seed for user visiting registration page
    const seed = Chan.createSeed()
    const seedHex = Chan.seedToHex(seed)
    const seedWords = Chan.seedToWords(seed)
    
    $(".seed").text(seedWords)
  }
  
  // get it started
  Chan.Register.main()
})