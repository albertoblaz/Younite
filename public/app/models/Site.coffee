class App.Site extends Monocle.Model

    @fields "id", "name", "description", "city", "address", "picture",
            "style", "users", "events", "owner", "loved", "recommended"


    validate: ->
        unless @id
            "id is required"
        unless @name
            "name is required"

    toggleLove: (user) ->
        @loved = !@loved
        console.log @loved
        @
