#_require ../models/Site.coffee

class App.SiteView extends Monocle.View

    template_url: "app/templates/SiteTemplate.mustache"


    events:
        "tap .button" : "onLove"
        "tap li"      : "onTap"


    constructor: ->
        super
        App.Site.bind "removeSiteView", @removeSiteView


    onTap: (event) ->
        Monocle.Route.navigate "/sites/#{@model.id}"


    onLove: (event) ->
        event.preventDefault()
        event.stopPropagation()
        @model.love()
        @refresh()


    removeSiteView: (model) =>
        console.log "remove", model
        if @model.equal model
            do @el.remove
            App.Site.unbind "removeSiteView", @removeSiteView
            # SiteView = null
