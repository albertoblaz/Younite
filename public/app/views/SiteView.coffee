class App.SiteView extends Monocle.View

    template_url: "app/templates/SiteView.mustache"

    events:
        "tap .button"   : "onLove"
        "tap li" : "onTap"


    # constructor: ->
    #     super
    #     @li.on "tap", @onTap


    onTap: (event) =>
        console.log "onTap"
        Monocle.Route.navigate "/sites/#{@model.id}"


    onLove: (event) ->
        event.preventDefault()
        event.stopPropagation()
        console.log "onLove"
        @model.toggleLove()
        console.log @model
        @remove()
