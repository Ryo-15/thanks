$(function(){
   // #back内の<a>タグがクリックされたときの処理
  $('#back a').on('click',function(){
    $('body, html').animate({  // $('セレクタ名').animate({
      scrollTop:0  // 変化対象のプロパティ名:変化値
    }, 800);  // }, アニメーションの動作時間);
    return false;
  });
});

