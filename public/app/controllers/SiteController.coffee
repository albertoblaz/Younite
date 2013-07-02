class App.SiteController extends Monocle.Controller

	elements:
		".title": "title"
		".picture": "picture"

	events:
		"tap .love": "onLove"


	constructor: ->
		

	onLove: ->


	render: (site) ->
		

	download: (id) ->
		# GET site usando el id y mostrar datos
		data = {}

		App.Site.create data
		@render 