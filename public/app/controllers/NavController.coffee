class App.NavController extends Monocle.Controller

	events:
		"tap .profile": "onProfile"


	onProfile: (event) ->
        Monocle.Route.navigate "/users/#{App.Me.id}"