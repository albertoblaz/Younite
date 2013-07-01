class App.Site extends Monocle.Model

    @fields "id", "name", "description", "city", "address", "picture", 
            "style", "users", "events", "owner", "loving", "recommended"
      

    validate: ->
        unless @name or @id
            "name is required"

    love: (user) ->
        console.log "love"
        # @users.push user
        # user.addSite @
        @
