#_require ../auxiliary/Utils.coffee
#_require ../auxiliary/Connector.coffee

class App.LoginListController extends Monocle.Controller

    events:
        "tap li": "onLogin"

    # constructor: (dom, @onSuccess, @errors) ->
    constructor: ->
        super
        Lungo.Router.section '#login-list'


    onLogin: (event) ->
        event.preventDefault() if event
        console.log @index()

        if App.Utils.online()
            p = App.Connector.login data
            p.done ->
                # App.Delegate.boot()
        else
            @onSuccess()    # Create the rest of app modules, but with offline data