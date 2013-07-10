#_require ../controllers/NavController.coffee
#_require ../controllers/ActivityController.coffee
#_require ../controllers/PartiesController.coffee
#_require ../controllers/SitesController.coffee
#_require ../controllers/MapController.coffee
#_require ../controllers/UserController.coffee
#_require ../controllers/FriendsController.coffee
#_require ../controllers/SettingsController.coffee
#_require ../controllers/HelpController.coffee

#_require ../controllers/PartyController.coffee
#_require ../controllers/SiteController.coffee

#_require ../controllers/LoginDirectController.coffee
#_require ../controllers/LoginFormController.coffee
#_require ../controllers/LoginListController.coffee
#_require ../controllers/SignupController.coffee

#_require ../auxiliary/Storage.coffee


class Delegate

    constructor: ->
        Lungo.ready =>
            users = App.Storage.users

            # No local data
            if not users or users.length is 0
                @showLoginForm()

            # With local data, one user
            else if users.length is 1
                @showLoginDirect()

            # With local data, multiple users
            else if users.length > 1
                @showLoginList()


    reboot: ->
        users = App.Storage.users

        if users.length > 1
            @showLoginList()
        else
            @showLoginForm()


    boot: ->
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
        # new App.SiteCommentsController "section#site"


    # Different UIs for making login

    showLoginForm: ->
        new App.LoginFormController "section#login-form"
        new App.SignupController "section.signup"
        # new App.SignupController "section#signup5"


    showLoginDirect: ->
        new App.LoginDirectController "section#login-direct"


    showLoginList: ->
        new App.LoginListController "section#login-list"
        new App.SignupController "section.signup"


App.Delegate = new Delegate

