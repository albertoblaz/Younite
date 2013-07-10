class App.User extends Monocle.Model

    @fields "id",
            "username", "password", # TODO que la API devuelva estos
            "displayName", "picture", "gender", "city", "public",
            "likes", "birthday", "sites", "friends", "events", "bio", "role", "timeline", "activity"
            "music", "ambient", "maxprice", "age" # TODO que la API devuelva estos


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


    delete: ->
        # App.Storage.delete()
        # App.Connector.delete()
        # App.Delegate.reboot()
