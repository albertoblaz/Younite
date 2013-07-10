#_require ../auxiliary/Connector.coffee
#_require ../models/User.coffee
#_require ../views/UserView.coffee

class App.FriendsController extends Monocle.Controller

    elements:
        "#friends": "friends"


    events:
        "tap #btn-search": "onSearch"


    constructor: ->
        super
        @render App.Me


    onSearch: (event) ->
        console.log "search", event


    render: (user) ->
        if user.friends
            for fid in user.friends
                friend = App.User.findBy "id", fid
                view = new App.UserView model: friend
                view.container = @friends
                view.append friend
        @
