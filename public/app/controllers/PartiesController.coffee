#_require ../auxiliary/Utils.coffee
#_require ../auxiliary/Connector.coffee
#_require ../models/Party.coffee
#_require ../views/PartyView.coffee

class App.PartiesController extends Monocle.Controller

    elements:
        "#following ul"   : "fol"
        "#recommended ul" : "rec"
        "#count-fol"      : "countfol"
        "#count-rec"      : "countrec"


    events:
        "tap #search"   : "onSearch"
        "load #parties" : "onLoad"


    constructor: ->
        super

        # Events Bounded
        App.Party.bind "create", @bindCreate
        App.Party.bind "change", @bindChange
        App.Party.bind "delete", @bindDelete
        App.Party.bind "error",  @bindError

        # GET parties from Connector
        p = $.getJSON "/events"
        p.done (parties) =>
            console.log parties
            for p in parties
                p.site = App.Site.findBy "id", p.idDisco
                App.Party.create p

        p.fail App.Utils.fail


    onLoad: (event) ->
        do @render


    onSearch: (event) ->
        # console.log "Searching"


    render: ->
        num = @fol.children().length
        if num then @countfol.css("display", "inline").text num else do @countfol.hide

        num = @rec.children().length
        if num then @countrec.css("display", "inline").text num else do @countrec.hide


    bindCreate: (party) =>
        # console.log "You've created #{party.name}!"
        view = new App.PartyView model: party
        view.container = @fol
        view.append party

        # if party.loved
        #     view.container = @fav
        #     view.append party
        # else if party.recommended
        #     view.container = @rec
        #     view.append party


    bindChange: (party) =>
        # console.log "You've changed #{party.name}!"


    bindDelete: (party) =>
        App.Utils.showError "Deleting the party #{party.name}"
        throw "You've deleted #{party.name}!, #{party}"


    bindError: (party) =>
        App.Utils.showError "Site error spotted, #{party.name}!"
