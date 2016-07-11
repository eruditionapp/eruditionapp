/**
 * Home module
 *
 */
var home = (function() {
  
  return {

    handleCoverSlides: function() {
      var slidesContainer = $('.home-cover .slides');
      var slides = $('.home-cover .slide');
      var slideNavButtons = $('.home-cover .slide-nav button');
      var slideCount = slides.length;
      var slideInterval = 5000;
      var slideActiveIndex = 1;
      var slideCycle = setInterval(function(){ updateSlideActiveIndex(slideActiveIndex, 'active cycle') }, slideInterval);

      function stopSlideCycle() {
        clearInterval(slideCycle);
      }

      function updateSlideActiveIndex(slideIndex, buttonClass) {
        $('.home-cover').attr('data-active-index', slideIndex);
        slideNavButtons.removeClass('active cycle');
        slideNavButtons.eq(slideIndex - 1).addClass(buttonClass);
        if (slideActiveIndex === slideCount) {
          stopSlideCycle();
        } else {
          slideActiveIndex++;
        }
      }

      function removeSlideTransition() {
        slidesContainer.addClass('no-transition');
        setTimeout(function() {
          slidesContainer.removeClass('no-transition');
        }, 100);
      }

      slideNavButtons.on('click', function() {
        slideActiveIndex = $(this).index() + 1;
        updateSlideActiveIndex(slideActiveIndex, 'active');
        stopSlideCycle();
      });

      $(window).on('resize', function() {
        removeSlideTransition();
      });
    }
  }
})();
