var init = function() {
  admin.handleOrganizeCards();
};

$(document).ready(function() {
  init();
});

// re-init for turbolinks renders
$(document).on('page:load', function() {
  init();
});
