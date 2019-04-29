document.addEventListener('DOMContentLoaded', function(){
  // メニューボタンを押した時の挙動
  document.querySelector("header > .mobile.bar > .menu-btn").onclick = function() {
    document.querySelector("header > .mobile.contents").style.display = "block";
  };

  // 閉じるボタンを押した時の挙動
  document.querySelector("header > .mobile.contents > .close-btn").onclick = function() {
    document.querySelector("header > .mobile.contents").style.display = "none";
  };
}, false);
