class App.User extends Monocle.Model

    @fields "id", "username", "password", "timeline", "public", "role",
            "displayName", "picture", "bio", "birthdate", "age", "music", "ambient", "maxprice", "gender", "city",
            "events", "activity", "sites", "recommendedSites", "friends", "petitionsFrom", "petitionsTo"


    # constructor: (data) ->
    #     super


    validate: ->
    	"id is required" unless @id

        # TODO Calcular age a partir de la fecha actual y de birthdate

        # TODO que la API devuelva esto tambien
        # unless @username
        #     "name is required"


    me: ->
        @id is App.Me.id


    saveRecommendation: (site) ->
        @recommendedSites.push site
        @updateAttributes recommendedSites: @recommendedSites
        @


    recommendToFriends: (site) ->
        for f in @friends
            f.saveRecommendation site
        @


    delete: ->
        # App.Storage.delete()
        # App.Connector.delete()
        # App.Delegate.reboot()
