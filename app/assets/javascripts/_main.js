var init = function() {
  admin.handleTableLinks();
  admin.handleOrganizeCards();
};

$(document).ready(function() {
  init();
});

// re-init for turbolinks renders
$(document).on('page:load', function() {
  init();
});
