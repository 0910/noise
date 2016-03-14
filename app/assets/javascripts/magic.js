soundManager.url = 'swf/';
soundManager.flashVersion = 9;
soundManager.useHTML5Audio = true;
soundManager.debugMode = false;
$(document).ready(function(){
  $('#fap').fullwidthAudioPlayer({autoPlay: false });
});