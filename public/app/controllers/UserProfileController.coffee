#_require ../auxiliary/Connector.coffee
#_require ../models/User.coffee
#_require ../views/UserView.coffee

class App.UserProfileController extends Monocle.Controller

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
        "tap #btn-edit": "onEdit"
        "tap .taste"   : "onTapTaste"


    constructor: ->
        super
        @render App.Me


    onEdit: (event) ->
        console.log "edit", event


    onTapTaste: (event) ->
        console.log "tapTaste", event


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
        if user.friends
            for fid in user.friends
                friend = App.User.findBy "id", fid
                console.log friend
                view = new App.UserView model: friend
                view.container = @friends
                view.append friend
        @