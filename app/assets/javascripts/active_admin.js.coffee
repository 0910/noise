#= require active_admin/base
#= require active_admin/select2
#= require jquery.multiple.select

ready = ->
	$('#event_artist_ids').multipleSelect()
	set_admin_selectable_events()

set_admin_selectable_events = ->
	$('select.admin-selectable').on 'change', (e) ->
		path = $(e.currentTarget).attr('data-path')
		attr = $(e.currentTarget).attr('data-attr')
		resource_id = $(e.currentTarget).attr('data-resource-id')
		val = $(e.currentTarget).val()
		val = $.trim(val)
		payload = {}
		resource_class = path.slice(0, -1)
		payload[resource_class] = {}
		payload[resource_class][attr] = val

		$.ajax
			url: '/admin/' + path + '/' + resource_id
			type: 'PUT'
			data: payload

	return

$(document).ready(ready);