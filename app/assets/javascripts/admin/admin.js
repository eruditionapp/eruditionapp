/**
 * Admin module
 *
 */
var admin = (function() {

  var tableLinks = querySelector('.table-links');

  return {

    handleTableLinks: function() {
      var clickTableLink = function() {
        if (event.target.parentElement.dataset.link) {
          window.location = event.target.parentElement.dataset.link;
        }
        event.stopPropagation();
      };
      if (tableLinks) {
        tableLinks.addEventListener('click', clickTableLink, false);
      }
    }

  }

}());

admin.handleTableLinks();
