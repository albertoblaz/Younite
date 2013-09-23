#_require ../models/Party.coffee

class App.PartyView extends Monocle.View

    template_url: "app/templates/PartyTemplate.mustache"


    events:
        "tap .button" : "onAttend"
        "tap li"      : "onTap"


    constructor: ->
        super


    onTap: (event) ->
        Monocle.Route.navigate "/parties/#{@model.id}"


    onAttend: (event) ->
        event.preventDefault()
        event.stopPropagation()
        @model.attend()
