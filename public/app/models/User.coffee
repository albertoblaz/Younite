class App.User extends Monocle.Model

    @fields "displayName", "picture", "gender", "city", "public", "likes", "birthday", "sites", "friends", "events", "bio", "role", "timeline"


    constructor: (data) ->
        print data


    validate : ->
        unless @name
            "name is required"
