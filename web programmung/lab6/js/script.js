document.addEventListener("DOMContentLoaded", function() {
    const swiper = new Swiper('.swiper', {
        direction: 'horizontal',
        loop: true,
        spaceBetween: 100,
        slidesPerView: 3,
        centeredSlides: true,
              
        pagination: {
          el: '.swiper-pagination',
          clickable: true,
        },
    });

    ymaps.ready(init);
    function init(){
        var myMap = new ymaps.Map("map", {
            center: [55.76, 37.64],
            zoom: 7
        });
    }
})