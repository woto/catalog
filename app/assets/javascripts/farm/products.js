document.addEventListener("turbolinks:before-cache", function() {
  $('.slider-for, .slider-nav').each(function(){
    this.slick.unslick();
  })
});

$(document).on('turbolinks:load', function(){
   $('.slider-for').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    fade: true,
    asNavFor: '.slider-nav',
    dots: true
  });
  $('.slider-nav').slick({
    slidesToShow: 3,
    slidesToScroll: 1,
    arrows: false,
    asNavFor: '.slider-for',
    centerMode: true,
    focusOnSelect: true
  });

  //$('img.photo')
  //  .closest('.vcenter').zoom({url: 'http://pi1.lmcdn.ru/product/N/E/NE007AUHIG83_2_v1.jpg'});

  $('img.photo')
    //.wrap('<span style="display:inline-block"></span>')
    //.css('display', 'block')
    .closest('.tmp')
    .zoom();
})
