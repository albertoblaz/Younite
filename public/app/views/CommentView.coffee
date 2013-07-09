#_require ../models/Comment.coffee

class App.CommentView extends Monocle.View

    template_url: "app/templates/CommentView.mustache"


    events:
        "tap li" : "onTap"


    constructor: ->
        super


    onTap: (event) ->
        console.log "onTap, see profile"
        Monocle.Route.navigate "/users/#{@model.id}"