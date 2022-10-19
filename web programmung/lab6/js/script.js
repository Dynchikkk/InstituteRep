document.addEventListener("DOMContentLoaded", function() {
    const swiper = new Swiper('.swiper', {
        direction: 'horizontal',
        loop: false,
        spaceBetween: 50,
        slidesPerView: 2,
      
        pagination: {
          el: '.swiper-pagination',
        },
      
        // navigation: {
        //   nextEl: '.swiper-button-next',
        //   prevEl: '.swiper-button-prev',
        // },
    });
})