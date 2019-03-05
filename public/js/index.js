$(function(){
  // メニューボタンを押した時の挙動
  $("header .mobile .menu-btn").on("click", function() {
    $("#mobile-menu").show();
  });

  // 閉じるボタンを押した時の挙動
  $("#mobile-menu .close-btn").on("click", function() {
    $("#mobile-menu").hide();
  })
});
