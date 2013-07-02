class App.UserController extends Monocle.Controller

	elements:
		".title"   : "title"
		".picture" : "picture"
		".music"   : "music"
		".ambient" : "ambient"
		".age"     : "age"
		".price"   : "price"
		".bio"     : "bio"

	events:
		# "load #profile" : "onLoad"
		"tap .taste"    : "onTapTaste"


	constructor: ->
		@downloadMe()

		$$('#profile').on "load", (event) =>
			@onLoad event


	download: (id) ->


	downloadMe: ->
		p = $.get "/users/me"

		p.done (data) =>
    		App.Me = new App.User data
    		App.Me.save()
    		@render App.Me

		p.fail (err) => 
			console.log err
			# TODO
			throw "Not user"


	onLoad: (event) ->
		console.log "onLoad!!", event
		# TODO Renderizar el usuario seleccionado
		# para ello hace falta saber como se accedio a la ventana
		# Si fue haciendo 'tap' en profile, es el usuario 'me'
		# Si no, es el usuario pulsado, y por eso hay que buscarle
		if event.srcElement.search "#profile" is not -1
			@render App.Me
		else 
			@render App.CurrentUser 


	onTapTaste: (event) ->
		console.log event


	render: (user) ->
		console.log user
		@title   = user.displayName
		@picture = user.picture
		@bio     = user.bio
		@age     = user.birthday