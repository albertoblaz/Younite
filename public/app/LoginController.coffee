class App.LoginController extends Monocle.Controller

    elements:
        "#login-name"     : "name"
        "#login-password" : "pass"

    events:
        "tap .btn-login"  : "onLogin"


    onLogin: (event) ->
        event.preventDefault()
        data =
            username: @name.val() or ""
            password: @pass.val() or ""
        App.Auth.login data, @onSuccess, @onError


    onSuccess: (remoteData) ->
        Lungo.Router.section('#activity')


    onError: (remoteData) ->
        Lungo.Notification.error(
            "Error",                        # Title
            "Login failed :(",              # Description
            "cancel",                       # Icon
            2                               # Time on screen
        )
        # throw "Authentication Required"
