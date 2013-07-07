class App.SiteController extends Monocle.Controller

	elements:
		"#name"        : "name"
		"#picture"     : "picture"

		"#music"       : "music"
		"#ambient"     : "ambient"
		"#age"         : "age"
		"#maxprice"    : "maxprice"

		"#description" : "description"
		"#comments"    : "comments"

		"#love"        : "love"


	events:
		"tap #love": "onLove"


	currentSite: null


	constructor: ->
		super

		# Routing
		@routes
		   "/sites/:id" : @viewSiteProfile
		Monocle.Route.listen()


	onLove: ->
		@currentSite.love()
		@renderLove @currentSite


	viewSiteProfile: (params) ->
		site = App.Site.findBy "id", params.id
		site = @download params.id if not site

		@render site
		@currentSite = site
		Lungo.Router.section "#site"


	render: (site) ->
		@name.text site.name
		@picture[0].src = site.picture

		@renderLove site


	renderLove: (site) ->
		label = @love.find "abbr"
		icon  = @love.find ".icon"

		if site.attributes().loved
			label.text "Loving"
			icon.removeClass("heart-full").addClass("heart")
		else
			label.text "Love?"
			icon.removeClass("heart").addClass("heart-full")


	download: (id) ->
		console.log "download site #{id}"
		# GET site usando el id y mostrar datos
		data = App.Connector.sites.get(id)
		App.Site.create data

