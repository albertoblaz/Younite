class App.UserController extends Monocle.Controller

	elements: ->
		".music"   : "music"
		".ambient" : "ambient"
		".age"     : "age"
		".price"   : "price"
		".bio"     : "bio"
		".picture" : "picture"

	events: ->
		"tap .taste" : "onTapTaste"
		
	constructor: ->
		p = $.get("/users/me");
		p.done (data) =>
    		App.Me = new App.User data
    		@picture = data.picture
		p.fail (err) => 
			console.log err
			# TODO
			throw "Not user"

	onTapTaste: (event) ->
		print event
		

