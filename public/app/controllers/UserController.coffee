class App.UserController extends Monocle.Controller

	elements:
		# Article 1
		"#displayName" : "displayName"
		"#picture"     : "picture"

		"#music"       : "music"
		"#ambient"     : "ambient"
		"#age"         : "age"
		"#maxprice"    : "maxprice"

		"#bio"         : "bio"

		# Article 2
		"#timeline"    : "timeline"

	events:
		"load #profile" : "onLoad"
		"tap .taste"    : "onTapTaste"


	constructor: ->
		super
		@downloadMe()


	download: (id) ->


	downloadMe: ->
		# App.User.bind "create", @bindUserCreate
		p = $.get "/users/me"

		p.done (data) =>
			console.log data
			user = new App.User data
			user.save()
			# TODO Get Timeline
			@render user.attributes()
			# TODO pasarle a render todos los datos, tanto user como sus eventos de timeline
			App.Me = user

		p.fail App.Utils.fail

		# p.fail (xhr) =>
		# 	# console.log err
		# 	# TODO
		# 	throw "Not user"


	# bindUserCreate: (user) =>



	onLoad: (event) ->
		console.log "onLoad!!", event
		# TODO Renderizar el usuario seleccionado
		# para ello hace falta saber como se accedio a la ventana
		# Si fue haciendo 'tap' en profile, es el usuario 'me'
		# Si no, es el usuario pulsado, y por eso hay que buscarle

		# if event.srcElement.search "#profile" is not -1
		# 	@render App.Me
		# else
		# 	@render App.CurrentUser


	onTapTaste: (event) ->
		console.log event


	render: (user) ->
		# TODO Refactorizar con un bucles, salvo picture
		@displayName.text user.displayName
		# @picture[0].src = user.picture

		@music.text user.music
		@ambient.text user.ambient
		@age.text user.birthday
		@maxprice.text user.maxprice

		@bio.text user.bio