class App.SiteController extends Monocle.Controller

	elements:
		".title": "title"
		".picture": "picture"

	events:
		"tap .love": "onLove"


	constructor: ->
		super

		# Routing
		@routes
		   "/sites/:name" : @viewSiteProfile
		Monocle.Route.listen()

	onLove: ->


	render: (site) ->


	download: (id) ->
		# GET site usando el id y mostrar datos
		data = {}

		App.Site.create data
		@render

	viewSiteProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"
        Lungo.Router.section "#site"