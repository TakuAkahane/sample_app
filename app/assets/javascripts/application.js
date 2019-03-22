//= require tether
//= require jquery-3.3.1.min
//= require bootstrap-sprockets
//= require popper.min
//= require bootstrap.min
//= require mdb.min
//= require ie-shim
//= require jquery_ujs
//= require autosize
//= require data-confirm-modal
//= require jquery.matchHeight
//= require i18n
//= require i18n/translations
//= require toastr

$(document).on('ready page:load', function(){
  $.material.init();
});
new WOW().init();
