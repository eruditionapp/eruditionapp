/**
 * Dashboard module
 *
 */
var dashboard = (function() {

  return {

    handleDeckPreviews: function() {
      $('[data-toggle="popover"]').popover();
    },

    handleCategoryFilter: function() {
      // handle click event bugs from bootstrap popover
      // https://github.com/twbs/bootstrap/issues/16732
      $('.browse-decks-container').on('hidden.bs.popover', function (e) {
          $(e.target).data("bs.popover").inState.click = false;
      });

      $('.browse-decks-container').on("click", ".btn-close-category-filter", function(event) {
        $('.btn-category-filter').popover('hide');
      });
    }
  }
})();
