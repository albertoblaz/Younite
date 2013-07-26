#_require ../controllers/NavController.coffee
#_require ../controllers/ActivityController.coffee
#_require ../controllers/PartiesController.coffee
#_require ../controllers/SitesController.coffee
#_require ../controllers/MapController.coffee
#_require ../controllers/FriendsController.coffee
#_require ../controllers/SettingsController.coffee
#_require ../controllers/HelpController.coffee

#_require ../controllers/UserProfileController.coffee
#_require ../controllers/UserFriendController.coffee

#_require ../controllers/PartyController.coffee
#_require ../controllers/SiteController.coffee

#_require ../controllers/LoginDirectController.coffee
#_require ../controllers/LoginFormController.coffee
#_require ../controllers/LoginListController.coffee
#_require ../controllers/SignupController.coffee

#_require ../auxiliary/Storage.coffee


class Delegate

    booted: false
    bootVersion: 0


    constructor: ->
        Lungo.ready =>
            users = App.Storage.users

            # No local data
            if not users or users.length is 0
                do showLoginForm

            # With local data, one user
            else if users.length is 1
                do showLoginDirect

            # With local data, multiple users
            else if users.length > 1
                do showLoginList


    boot: ->
        @booted = true
        @bootVersion++

        new App.NavController "aside#nav"

        new App.ActivityController "section#activity"
        new App.SitesController "section#sites"
        new App.PartiesController "section#parties"
        new App.MapController "section#map"
        new App.FriendsController "section#friends"
        new App.SettingsController "section#settings"
        new App.HelpController "section#help"

        new App.UserProfileController "section#profile"
        new App.UserFriendController "section#profile-friend"

        new App.PartyController "section#party"
        new App.SiteController "section#site"
        # new App.SiteCommentsController "section#site"
        @


    reboot: ->
        users = App.Storage.users
        if users.length > 1 then do showLoginList else do showLoginForm



    # Different UIs for making login

    showLoginForm = ->
        new App.LoginFormController "section#login-form"
        new App.SignupController "section.signup"


    showLoginDirect = ->
        new App.LoginDirectController "section#login-direct"


    showLoginList = ->
        new App.LoginListController "section#login-list"
        new App.SignupController "section.signup"


App.Delegate = new Delegate

