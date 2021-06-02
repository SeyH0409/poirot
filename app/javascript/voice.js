function voice () {
  const body = document.getElementById("body");
  const readBtn = document.getElementById("read-btn");
  const cancelBtn = document.getElementById("cancel-btn");

  readBtn.addEventListener('click', function() {
    const uttr = new SpeechSynthesisUtterance(body.value)
    speechSynthesis.speak(uttr);
  });

  cancelBtn.addEventListener('click', function() {
    speechSynthesis.cancel();
  });
};

window.addEventListener("load", voice);