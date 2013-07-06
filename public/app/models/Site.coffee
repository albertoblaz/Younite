class App.Site extends Monocle.Model

    @fields "id", "name", "description", "city", "address", "picture",
            "style", "users", "events", "owner", "loved", "recommended"


    validate: ->
        unless @id
            "id is required"
        unless @name
            "name is required"


    love: (user) ->
        # IMPORTANT
        # Always trigger the event before the modifications, because this way
        # We will remove the old view, and then, update the model while creating the new view
        @trigger "love"
        @updateAttributes loved: not @loved
        @
