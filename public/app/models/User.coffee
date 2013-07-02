class App.User extends Monocle.Model

    @fields "id", "username", "password", "displayName", "picture", "gender", "city", "public", 
    		"likes", "birthday", "sites", "friends", "events", "bio", "role", "timeline", "activity"


    constructor: (data) ->
        console.log data


    validate: ->
    	unless @id
    		"id is required"
    	unless @username
        	"name is required"
