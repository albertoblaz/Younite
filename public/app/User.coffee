class App.User extends Monocle.Model

    @fields "displayName", "picture", "gender", "city", "public", "likes", "birthday", "sites", "friends", "events", "bio", "role", "timeline"


    initialize: ->
        # GET


    validate : ->
        unless @name
            "name is required"
