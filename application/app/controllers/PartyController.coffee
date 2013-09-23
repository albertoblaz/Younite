#_require ../auxiliary/Connector.coffee
#_require ../models/Party.coffee

class App.PartyController extends Monocle.Controller

    elements:
        "#name"        : "name"
        "#picture"     : "picture"
        "#description" : "description"
        "#friends"     : "friends"

        #TODO
        "#price"    : "price"


    events:
        "tap #btn-attend"    : "onAttend"
        "tap #btn-recommend" : "onRecommend"


    currentParty: null


    constructor: ->
        super

        # Routing
        @routes
           "/parties/:id" : @loadProfile
        Monocle.Route.listen()


    onAttend: (event) ->
        @currentSite.attend()

        # TODO esto deberia llevar a un controlador aparte para
        # - seleccionar numero de entradas/reservas
        # - realizar la compra o reserva gratuita pulsando un boton


    onRecommend: (event) ->
        Lungo.Notification.confirm
            icon: "thumbs-up"

            title: "Recommend?"

            description: "Do you want to recommend #{@currentParty.name} to your friends?"

            accept:
                icon: "check"
                label: "Recommend"
                callback: => do @currentParty.recommend

            cancel:
                icon: "multiply"
                label: "Cancel"


    loadProfile: (params) ->
        party = App.Party.findBy "id", params.id
        party = @download params.id if not party

        @render party
        @currentParty = party
        Lungo.Router.section "#party"


    render: (party) ->
        @renderInfo party
        @renderFriends party


    renderInfo: (party) ->
        @name.text party.name
        @description.text party.description
        @picture[0].src = party.picture


    renderFriends: (party) ->
        # nada de momento


    download: (id) ->
        console.log "download party #{id}"
        # GET party usando el id y mostrar datos
        data = App.Connector.parties.get id
        App.Party.create data
