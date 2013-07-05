class App.User extends Monocle.Model

    @fields "id",
            "username", "password", # TODO que la API devuelva estos
            "displayName", "picture", "gender", "city", "public",
            "likes", "birthday", "sites", "friends", "events", "bio", "role", "timeline", "activity"
            "music", "ambient", "maxprice", "age" # TODO que la API devuelva estos


    # constructor: (data) ->
    #     super


    validate: ->
    	unless @id
    	   "id is required"
    	# TODO que la API devuelva esto tambien
        # unless @username
        #     "name is required"


    delete: ->
        App.Storage.delete()
        App.Connector.delete()
        App.Delegate.reboot()
