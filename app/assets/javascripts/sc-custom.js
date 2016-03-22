//Custom SoundCloud Player JS

function addTracksSC( url, playnow ){
	//var hardUrl =  '/deep-house-amsterdam/jay-west-deep-house-amsterdam';
	//scplayer.add_tracks(hardUrl);
	var found_at_index = scplayer.add_tracks(url);
	
	if ( found_at_index == 'current_track'){
		//alert("it's the current track!");
	}
	
	if ( found_at_index != 'current_track'){

		var $pl = $("#playlist");		
		
		if ( found_at_index > 0 ){
			$pl.find( 'li:nth-child(' + ( found_at_index + 1 ) + ')' ).remove();
		}
		//if ( found_at_index == 0 ) {
			//var x=0;
			var playlist = scplayer.playlist();
			var l= playlist.length;
			l = l-1;

			var $li = jQuery("<li/>", {"html": "<span>loading..</span>"}).data('index', l).appendTo($pl);

			//lookup the track info
			scplayer.track_info(l).done(function(track){
				//console.log(track);
				$li.html('<span><div class="playlist-track-wrapper"><img class=\"playlist_artwork\" src=\"' + track.artwork_url + '\"/>' + track.title + '</span><a href="' + track.permalink_url + '" target="_blank" class="soundcloud-logo-small">View on Soundcloud</a></div>');
				//scplayer.goto(jQuery(this).data('index', l) ).play();
				//scplayer.goto(jQuery(this).data('index', l)).play();
			});
		//}

		//else {
			/* Remove n-th li (where the track was found, since we append to the end )*/
			//$pl.find( 'li:nth-child(' + ( found_at_index + 1 ) + ')').clone().appendTo($pl);
			//$pl.find( 'li:nth-child(' + ( found_at_index + 1 ) + ')' ).remove();
		//}

		if ( playnow == true ){
			$("#playlist li:last").find('span').click();
			//alert('clicked');
			//var track = scplayer.current_track;
			//$("#now_playing").html(track.title);
		}	
	}
}

/* generate the ids from the random number */
function getTrackArt( url, rand ){
	//alert( rand );

	var $art = jQuery( '#' + rand );
	var $title = jQuery( '#' + 'title-' + rand );
	var $download = jQuery ( '#' + 'download-' +rand );
	//alert( rand_b );

	scplayer.track_info(url).done(function(track){

		var the_artwork_url = '';
		//alert( track.artwork_url );
		if ( track.artwork_url != null ){
			the_artwork_url = track.artwork_url;
		}
		else{
			the_artwork_url = '/wp-content/themes/nest/js/images/nest-placeholder-art.jpg';
		}

		$art.html( '<img src="' + the_artwork_url + '" />');
		$title.html( track.title );

		if ( track.downloadable == true){
			/* 	Temporary solution - need to request stream for d/load url to work, possibly, 
				so need to write another function to add track to playlist, start download (then delete?) 
			*/

			//$download.html( '<form action=http://'+window.location.hostname+'/html/wp-content/themes/nest/force-download.php method="POST" id="track_download"><input type=hidden name=path value=-1><a class="download" href="' + track.download_url + '?client_id=f18fec54bc96c697f0caf6aedc92f666' + '" target="_blank">Download</a></form>');
			$download.html( '<a class="download" href="' + track.download_url + '?client_id=f18fec54bc96c697f0caf6aedc92f666' + '" target="_blank">Download</a>');
		}

		//alert( track.title );
	});
}

function addGroupSC(list, playnow) {
	var listLength = list.length;
	for (var j=0; j<listLength; j++) {
		if (j==0 && playnow) {
			addTracksSC(list[j], true);
		}
		else {
			addTracksSC(list[j]);
		}
	}
}

/*
function newPlaylist( playlist ){
	scplayer.destroy();
	delete scplayer;
	loadSCPlayer( playlist );

}
*/