#= require active_admin/base
#= require active_admin/select2
#= require jquery.multiple.select

ready = ->
	$('#event_artist_ids').multipleSelect();
