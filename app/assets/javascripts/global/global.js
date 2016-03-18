/**
 * Global vars & module
 *
 */
var querySelector = document.querySelector.bind(document);


// Hack for Turbolinks and Bootstrap Sprockets binding issue
$(document).ready(function(){
  $('.dropdown-toggle').dropdown();
});
