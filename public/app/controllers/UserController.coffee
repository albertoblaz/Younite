#_require ../auxiliary/Connector.coffee
#_require ../models/User.coffee

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
        "tap .taste"    : "onTapTaste"


    currentUser: null


    constructor: ->
        super

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
        user = user.attributes()

        # TODO Refactorizar con un bucles, salvo picture
        @displayName.text user.displayName
        # @picture[0].src = user.picture

        @music.text user.music
        @ambient.text user.ambient
        @age.text user.birthday
        @maxprice.text user.maxprice

        @bio.text user.bio


    download: (id) ->
        console.log "download #{id}"