#_require ../auxiliary/Connector.coffee
#_require ../models/User.coffee
#_require ../views/UserView.coffee

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


        # Article 4
        "#friends"     : "friends"


    events:
        "tap .taste"   : "onTapTaste"


    currentUser: null


    constructor: ->
        super

        # TESTING
        for fid in App.Me.friends
            q = $.get "/users/#{fid}"
            q.done (data) =>
                console.log data
                App.User.create data
        # END TESTING

        @routes
           "/users/:id" : @loadProfile
        Monocle.Route.listen()


    onTapTaste: (event) ->
        console.log event


    loadProfile: (params) ->
        user = App.User.findBy "id", params.id
        user = @download params.id if not user

        @render user
        @currentUser = user
        Lungo.Router.section "#profile"


    render: (user) ->
        @renderInfo user
        @renderActivty user
        @renderSites user
        @renderFriends user


    renderInfo: (user) ->
        @picture[0].src = user.picture
        for prop in [ "displayName", "music", "ambient", "age", "maxprice", "bio" ]
            @[prop].text user[prop]


    renderActivty: (user) ->
        # No hacemos ná


    renderSites: (user) ->
        # No hacemos ná


    renderFriends: (user) ->
        do @friends.children(".friend").remove

        if user.friends
            # TODO Separar los amigos comunes del resto

            # Show / Hide the anchor elements: "Shared" and "Rest" friends
            method = if user.id is App.Me.id then "hide" else "show"
            do @friends.children(".anchor")[method]

            for fid in user.friends
                friend = App.User.findBy "id", fid
                view = new App.UserView model: friend
                view.container = @friends
                view.append friend


    download: (id) ->
        console.log "download #{id}"