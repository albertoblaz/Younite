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
        Lungo.Router.section '#activity'

        new App.NavController "aside#nav"

        new App.ActivityController "section#activity"
        new App.PartiesController "section#parties"
        new App.SitesController "section#sites"
        new App.MapController "section#map"
        new App.UserController "section#profile"
        new App.FriendsController "section#friends"
        new App.SettingsController "section#settings"
        new App.HelpController "section#help"

        new App.PartyController "section#party"
        new App.SiteController "section#site"

    onError: (remoteData) ->
        Lungo.Notification.error(
            "Error",                        # Title
            "Login failed :(",              # Description
            "cancel",                       # Icon
            2                               # Time on screen
        )
        # throw "Authentication Required"
