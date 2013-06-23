class Site extends Monocle.Model

    @fields "name", "description", "city", "address", "picture", "style", "users", "events", "owner"


    initialize: ->
        # GET

    validate : ->
        unless @name
            "name is required"

    @love: (user) ->
        @users.push user
        user.addSite @
        @
