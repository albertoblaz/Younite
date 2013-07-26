class App.Party extends Monocle.Model

    @fields "id", "name", "description", "date", "idDisco", "site", "users", "price"


    constructor: ->
        super
        # site = App.Site.findBy "idDisco", @idDisco
        # @site = site


    attend: ->
        @users.push App.Me
        @updateAttributes users: @users
        @


    recommend: ->



    validate: ->
        "id is required"   unless @id
        "name is required" unless @name
