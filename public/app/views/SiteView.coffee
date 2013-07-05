class App.SiteView extends Monocle.View

    template_url: "app/templates/SiteView.mustache"

    elements:
        "li.selectable" : "li"
        ".button"       : "button"

    events:
        "tap .button" : "onLove"
        "tap li"      : "onTap"


    # constructor: ->
    #     super
    #     @li.on "tap", @onTap


    onTap: (event) =>
        console.log "onTap"
        console.log window.location.host + "/sites/#{@model.name}"
        window.location.href = window.location.host + "/sites/#{@model.name}"
        # App.Currents.Site.update @model.id


    onLove: (event) ->
        console.log "onLove"
        # @model.toggleLove()
        # @remove()
