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
                App.Delegate.boot()
            # p.fail (xhr) =>
            #     App.Utils.showError App.Messages.AuthenticationFailed
            p.fail App.Utils.fail
        else
            @onSuccess()    # Create the rest of app modules, but with offline data