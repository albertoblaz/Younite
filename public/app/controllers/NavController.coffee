class App.NavController extends Monocle.Controller

	events:
		"tap .profile": "onProfile"


	onProfile: (event) ->
		console.log "onProfile"
		# App.CurrentUser.updateAttributes App.Me.attributes()