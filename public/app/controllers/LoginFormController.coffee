#_require ../auxiliary/Utils.coffee
#_require ../auxiliary/Connector.coffee

class App.LoginFormController extends Monocle.Controller

    elements:
        "#username" : "username"
        "#password" : "password"

    events:
        "tap #btn-login"   : "onLogin"


    constructor: ->
        super
        Lungo.Router.section "login-form"


    onLogin: (event) ->
        event.preventDefault() if event

        user =
            username: @username.val()
            password: @password.val()

        if App.Utils.online()
            p = App.Connector.login user
            p.done =>
                App.Delegate.boot()
                Lungo.Router.section "activity"

            p.fail App.Utils.fail

        else
            App.Utils.showError App.Messages.InternetRequired