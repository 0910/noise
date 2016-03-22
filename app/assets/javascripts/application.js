// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.pjax
//= require bootstrap-sprockets
//= require jquery.easing.min
//= require mixitup
//= require swiper.jquery
//= require swipebox
//= require jpreloader
//= require soundmanager2
//= require sc-player
//= require sc-player-waveform
//= require player
//= require_tree .
$(function() {
  $.pjax.defaults.timeout = 6000
  $(document).pjax('a:not([data-remote]):not([data-behavior]):not([data-skip-pjax])', '[data-pjax-container]')
});