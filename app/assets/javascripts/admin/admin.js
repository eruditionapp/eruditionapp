/**
 * Admin module
 *
 */
var admin = (function() {

  var tableLinks = querySelector('.table-links');
  
  var promptAddBtn = querySelector('.organize-prompt-btn-add');
  var promptText = querySelector('.organize-prompt-text');
  var promptList = querySelector('.organize-prompt-list');

  return {

    handleTableLinks: function() {
      var clickTableLink = function(event) {
        if (event.target.parentElement.dataset.link) {
          window.location = event.target.parentElement.dataset.link;
        }
        event.stopPropagation();
      };
      if (tableLinks) {
        tableLinks.addEventListener('click', clickTableLink, false);
      }
    },
    handleOrganizeCards: function() {
      var clickAddPrompt = function() {
        if (!promptText.value.length) {
          return;
        }
        var promptEl = document.createElement('li');
        var promptMoveEl = document.createElement('span');
        var promptContentEl = document.createTextNode(promptText.value);
        var promptRemoveEl = document.createElement('span');
        
        promptEl.className = 'list-group-item';
        promptMoveEl.className = 'glyphicon glyphicon-resize-vertical';
        promptRemoveEl.className = 'glyphicon glyphicon-remove organize-prompt-btn-remove';
        
        promptEl.appendChild(promptMoveEl);
        promptEl.appendChild(promptContentEl);
        promptEl.appendChild(promptRemoveEl);
        
        promptList.appendChild(promptEl);
      }
      var clickRemovePrompt = function(event) {
        if (!event.target.classList.contains('organize-prompt-btn-remove')) {
          return;
        }
        var promptEl = event.target.parentElement;
        promptList.removeChild(promptEl);
        event.stopPropagation();
      }
      if (promptList) {
        promptAddBtn.addEventListener('click', clickAddPrompt, false);
        promptList.addEventListener('click', clickRemovePrompt, false);
      }
    }
  }
}());

admin.handleTableLinks();
admin.handleOrganizeCards();
