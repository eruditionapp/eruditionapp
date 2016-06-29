/**
 * Main init
 *
 */
var init = function() {
  var page = $('#page');

  // Page specific JS
  if (page.hasClass('page-home')) {
    home.handleCoverSlides();
  } else if (page.hassClass('page-admin-card')) {
    admin.handleOrganizeCards();
  }
};

$(document).ready(function() {
  init();
});

// Re-init for turbolinks renders
$(document).on('page:load', function() {
  init();
});
