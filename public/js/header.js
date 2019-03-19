$(function(){
  // メニューボタンを押した時の挙動
  $("header > .mobile.bar > .menu-btn").on("click", function() {
    $("header > .mobile.contents").show();
  });

  // 閉じるボタンを押した時の挙動
  $("header > .mobile.contents > .close-btn").on("click", function() {
    $("header > .mobile.contents").hide();
  })
});
