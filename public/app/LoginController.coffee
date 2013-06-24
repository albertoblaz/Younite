class App.LoginController extends Monocle.Controller

    elements:
        "#login-name"     : "name"
        "#login-password" : "pass"

    events:
        "tap .btn-login"  : "onLogin"


    checkData: ->
        unless @name.val() or @pass.val()
            @showError()
        data =
            "name" : @name.val() or ""
            "pass" : @pass.val() or ""


    onLogin: (event) ->
        event.preventDefault()
        data = @checkData()

        # Verify local data saved before
        res = App.StorageManager.login data
        if not res
            @showError()
        else
            Lungo.Router.section('#activity')

        # if not, POST request to authenticate
        # res = App.Connector.login data
        # @showError() unless res


    showError: ->
        Lungo.Notification.error(
            "Error",                        # Title
            "Login failed :(",              # Description
            "cancel",                       # Icon
            2                               # Time on screen
        )
        # throw "Authentication Required"


cont = new App.LoginController "section#login"
