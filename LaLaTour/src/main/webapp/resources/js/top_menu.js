$( document ).ready( function() {
        var jbOffset = $( '.zeta-menu' ).offset();
        $( window ).scroll( function() {
          if ( $( document ).scrollTop() > jbOffset.top ) {
            $( '.zeta-menu' ).addClass( 'f-nav' );
            $( '.zeta-menu' ).addClass( '' );
            $("#mainLogoImg").hide();
            $("#mainLogoImgAf").show();
            //alert("scroll test");
          }
          else {
            $( '.zeta-menu' ).removeClass( 'f-nav' );
            $("#mainLogoImgAf").hide();
            $("#mainLogoImg").show();
          }
        });
      } );

$(function(){
  $(".zeta-menu li").hover(function(){
    $('ul:first',this).show();
  }, function(){
    $('ul:first',this).hide();
  });
  $(".zeta-menu>li:has(ul)>a").each( function() {
    /*$(this).html( $(this).html()+' &or;' );*/
  });
  $(".zeta-menu ul li:has(ul)")
    .find("a:first")
    .append("<p style='float:right;margin:-3px'>&#9656;</p>");
});