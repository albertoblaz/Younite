#_require ../auxiliary/Connector.coffee
#_require ../models/User.coffee
#_require ../views/UserView.coffee

class App.UserFriendController extends Monocle.Controller

    elements:
        # Article 1
        "#displayName"    : "displayName"
        "#picture"        : "picture"

        "#music"          : "music"
        "#ambient"        : "ambient"
        "#age"            : "age"
        "#maxprice"       : "maxprice"

        "#bio"            : "bio"

        # Article 2
        "#timeline"       : "timeline"

        # Article 4
        "#friends-shared" : "shared"
        "#friends-rest"   : "rest"


    events:
        "tap #btn-follow" : "onFollow"
        "tap .taste"      : "onTapTaste"


    currentUser: null


    constructor: ->
        super

        @routes
           "/users/:id" : @loadProfile
        Monocle.Route.listen()


    onFollow: (event) ->
        # No hacemos ná


    loadProfile: (params) =>
        user = App.User.findBy "id", params.id
        user = @download params.id if not user

        @render user
        @currentUser = user

        if not user.me()
            Lungo.Router.section "profile-friend"
        else
            Lungo.Router.section "profile"


    render: (user) ->
        @renderInfo user
        @renderActivty user
        @renderSites user
        @renderFriends user


    renderInfo: (user) ->
        @picture[0].src = user.picture
        for prop in [ "displayName", "music", "ambient", "age", "maxprice", "bio" ]
            @[prop].text user[prop]
        @


    renderActivty: (user) ->
        # No hacemos ná
        @


    renderSites: (user) ->
        # No hacemos ná
        @


    renderFriends: (user) ->
        # TODO Borrar Views, no DOM elements
        do @shared.children(".friend").remove
        do @rest.children(".friend").remove

        if user.friends
            # TODO Separar los amigos comunes del resto

            # Show / Hide the anchor elements: "Shared" and "Rest" friends
            method = if user.me() then "hide" else "show"
            do @shared.children(".anchor")[method]
            do @rest.children(".anchor")[method]

            for fid in user.friends
                friend = App.User.findBy "id", fid
                view = new App.UserView model: friend
                view.container = @shared
                view.append friend
        @


    download: (id) ->
        console.log "download #{id}"
