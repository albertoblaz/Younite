class App.SignupController extends Monocle.Controller

    elements:
        # Signup 1
        "#signup-name"      : "displayName"
        "#signup-birthdate" : "birthday"  # TODO cambiar por birthdate en el server
        "#signup-gender"    : "gender"
        "#signup-country"   : "country"
        "#signup-city"      : "city"

        # Signup 2
        # "#signup-music"     : "music"

        # Signup 3
        # "#signup-ambient"   : "ambient"

        # Signup 4
        # "#signup-picture"   : "picture"
        "#signup-bio"       : "bio"

        # Signup 5
        "#signup-username"  : "username"
        "#signup-password"  : "password"

    events:
        "tap .btn-signup" : "onSignup"


    constructor: ->
        super


    checkData: ->
        data = {}
        data.picture = "je"
        # Required data
        data.public = true
        data.likes = []

        for k, v of @elements
            data[v] = @[v].val()

        console.log data
        data


    onSignup: (event) ->
        event.preventDefault() if event
        data = @checkData()
        console.log "onSignup"
        console.log data
        p = App.Connector.signup data

        p.done (data) =>
            console.log data
            App.Delegate.boot()
            App.Utils.showSuccess App.Messages.UserCreated, ->
                Lungo.Router.section('#activity')

        p.fail App.Utils.fail
        # p.fail (xhr) =>
            # # App.Utils.showError App.Messages.SignupFailed
            # json = JSON.parse err.responseText
            # App.Utils.showError "#{k} #{v}" for k, v of json.errors

