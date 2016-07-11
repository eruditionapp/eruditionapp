/**
 * Admin module
 *
 */
var admin = (function() {

  return {

    handleOrganizeCards: function() {
      var itemAddBtn = querySelector('.organize-item-btn-add');
      var itemText = querySelector('.organize-item-text');
      var itemList = querySelector('.organize-item-list');
      
      function clickAddItem() {
        if (!itemText.value.length) {
          return;
        }
        var itemEl = document.createElement('li');
        var itemMoveEl = document.createElement('span');
        var itemContentEl = document.createTextNode(itemText.value);
        var itemRemoveEl = document.createElement('span');
        
        itemEl.className = 'list-group-item';
        itemMoveEl.className = 'glyphicon glyphicon-resize-vertical';
        itemRemoveEl.className = 'glyphicon glyphicon-remove organize-item-btn-remove';
        
        itemEl.appendChild(itemMoveEl);
        itemEl.appendChild(itemContentEl);
        itemEl.appendChild(itemRemoveEl);
        
        itemList.appendChild(itemEl);
      }

      function clickRemoveItem(event) {
        if (!event.target.classList.contains('organize-item-btn-remove')) {
          return;
        }
        var itemEl = event.target.parentElement;
        itemList.removeChild(itemEl);
        event.stopPropagation();
      }
      if (itemList) {
        itemAddBtn.addEventListener('click', clickAddItem, false);
        itemList.addEventListener('click', clickRemoveItem, false);
      }
    }
  }
})();
