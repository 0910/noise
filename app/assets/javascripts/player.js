$(function(){
	$controls = $(".controls");
	var scplayer = new SoundCloudPlayer([
			//"/diplo/wobble-prod-diplo",
			"/proyectual/sets/off-at-forum-2016"
		],{
		  consumer_key: "ePT3qXXTOjw4ZoZcN7ALQ"
		, autoplay: false
		, loop: false
		, toggle_pause: true
		, preload: true
	});
	var scwaveform = new SCWaveform(scplayer, {scrub:true});

	$controls.on("click", 'div', function(e){
		e.preventDefault();
		var $this = $(this)
		if( $this.hasClass('play') ){ scplayer.pause(); }
		else if( $this.hasClass('pause') ){ scplayer.pause(); }
		else if( $this.hasClass('stop') ){ scplayer.stop(); }
		else if( $this.hasClass('next') ){ scplayer.next(); }
		else if( $this.hasClass('prev') ){ scplayer.prev(); }
	});
	
	scplayer.on("scplayer.pause", function(e, is_paused){
		if(is_paused === true){
			$controls.find('.play').addClass("pause");
            $controls.find('.play').html('').append('<i class="fa fa-play"></i>');
		}else{
			$controls.find('.play').removeClass("pause");
            $controls.find('.play').html('').append('<i class="fa fa-pause"></i>');
		}
	});
	
	
	scplayer.on("scplayer.init", function(e, track, sound){
		var $pl = $("#playlist");
		$pl.empty();
		//
		var playlist = scplayer.playlist();
		for(var x=0, l=playlist.length; x<l; x++){
			var $li = $("<li/>", {"html": "loading.."}).data('index', x).appendTo($pl);
			(function(x,$li){
				//lookup the track info
				scplayer.track_info(x).done(function(track){
					//console.log(track);
					$li.html(track.title);
				});
			})(x,$li);			
		}
		
		$("#playlist").find('li:first').addClass('active');
	});
	
	
	scplayer.on("scplayer.changing_track", function(e, index){
		$("#playlist").find('li').removeClass('active').eq(index).addClass('active');
	});
	
	//click playlist tracks
	$("li", "#playlist").click(function(e){
		var $this = $(this);
		scplayer.goto($this.data('index')).play();
	});
    $('.plist').click(function(event){
        event.preventDefault();
        $('#playlist').fadeToggle(300);
    });
});