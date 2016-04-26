var init = function() {
  admin.handleOrganizeCards();
  dashboard.handleDeckPreviews();
  dashboard.handleCategoryFilter();
};

$(document).ready(function() {
  init();
});

// re-init for turbolinks renders
$(document).on('page:load', function() {
  init();
});
