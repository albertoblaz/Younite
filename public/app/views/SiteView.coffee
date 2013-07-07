class App.SiteView extends Monocle.View

    template_url: "app/templates/SiteView.mustache"

    events:
        "tap .button" : "onLove"
        "tap li" : "onTap"


    constructor: ->
        super
        App.Site.bind "removeSiteView", @removeSiteView


    onTap: (event) ->
        console.log "onTap"
        Monocle.Route.navigate "/sites/#{@model.id}"


    onLove: (event) ->
        event.preventDefault()
        event.stopPropagation()
        @model.love()
        @refresh()


    removeSiteView: (model) =>
        @el.remove() if @model.equal model