#_require ../models/User.coffee

class App.UserView extends Monocle.View

    template_url: "app/templates/UserTemplate.mustache"


    events:
        "tap .button" : "onFollow"
        "tap li"      : "onTap"


    constructor: ->
        super
        # App.Site.bind "removeSiteView", @removeSiteView


    onTap: (event) ->
        Monocle.Route.navigate "/users/#{@model.id}"


    onFollow: (event) ->
        # TODO Will be implemented soon
        event.preventDefault()
        event.stopPropagation()
        @model.follow()
        @refresh()


    # removeSiteView: (model) =>
    #     do @el.remove if @model.equal model
