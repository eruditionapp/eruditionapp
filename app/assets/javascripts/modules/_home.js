/**
 * Home module
 *
 */
var home = (function() {
  
  return {

    handleText: function(index) {

      // Destroy Typed data
      if ($('#typed').data('typed')) {
        clearInterval($('#typed').data('typed').timeout);
        $('#typed').removeData('typed');
        $('.typed-cursor').remove();
      }
      // Init/re-init Typed
      $("#typed").typed({
        strings: [$('#typed-strings p').eq(index).html()],
        typeSpeed: 25,
        showCursor: false,
        startDelay: 1000
      });
    },

    handleCoverSlides: function() {
      
      var slideCount = $('.slides ul li').length - 1;
      var slideInterval = 5000;      
      var slideActiveIndex = 0;

      var navigateSlides = function(direction) {
        // Update active index
        slideActiveIndex = $('.slides ul li.active').index();
        // Destroy active slide
        $('.slides ul li.active').removeClass('active');
        // Update active slide
        if ((direction === 'next') && (slideActiveIndex === slideCount)) {
          slideActiveIndex = 0;
        } else if ((direction === 'previous') && (slideActiveIndex === 0)) {
          slideActiveIndex = slideCount;
        } else if (direction === 'next') {
          slideActiveIndex++;
        } else {
          slideActiveIndex--;
        }
        $('.slides ul li').eq(slideActiveIndex).addClass('active');
        this.home.handleText(slideActiveIndex);
      };
      // Click next slide
      $('.controls .next').on('click', function() {
        navigateSlides('next');
      });
      // Click previous slide
      $('.controls .previous').on('click', function() {
        navigateSlides('previous');
      });
      // Load first slide
      this.handleText(0);
      $('.slides ul li').eq(0).addClass('active');
    }
  }
})();
