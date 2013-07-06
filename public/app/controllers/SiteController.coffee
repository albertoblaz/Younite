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

		"#love": "love"


	events:
		"tap #love": "onLove"


	currentSite: null


	constructor: ->
		super

		# Routing
		@routes
		   "/sites/:id" : @viewSiteProfile
		Monocle.Route.listen()


	viewSiteProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"
        site = App.Site.findBy "id", params.id
        @currentSite = site

        # site = @download params.id if not site
        @render site
        Lungo.Router.section "#site"


	render: (site) ->
		@name.text site.name
		@picture[0].src = site.picture

		@renderLove()


	renderLove: ->
		label = @love.find "abbr"
		icon  = @love.find ".icon"

		if @currentSite.attributes().loved
			label.text "Loving"
			icon.removeClass("heart-full").addClass("heart")
		else
			label.text "Love?"
			icon.removeClass("heart").addClass("heart-full")



	onLove: ->
		@currentSite.love()
		@renderLove()


	download: (id) ->
		# GET site usando el id y mostrar datos
		data = App.Connector.sites.get(id)
		App.Site.create data

