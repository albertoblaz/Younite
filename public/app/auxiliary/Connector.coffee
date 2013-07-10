#_require ../auxiliary/Utils.coffee
#_require ../models/User.coffee

class Connector

    URIS:
        me     : "/users/me"
        login  : "/users/login"
        logout : "/users/logout"
        signup : "/users"


    downloadMe: =>
        p = $.get @URIS.me
        p.done (me) =>
            # Download me
            console.log me
            user = App.User.create me
            App.Me = user

            # Download full info about each friend
            for fid in App.Me.friends
                q = $.get "/users/#{fid}"
                q.done (data) =>
                    console.log data
                    App.User.create data
                    do App.Delegate.boot

        p.fail App.Utils.fail


    login: (user) ->
        p = @auth @URIS.login, user
        p.done @downloadMe
        p.fail App.Utils.fail


    logout: (user) ->
        @auth @URIS.logout


    signup: (user) ->
        @auth @URIS.signup, user


    auth: (uri, data) ->
        console.log uri, data

        # jQuery works!
        $.ajaxSetup
            "contentType": "application/json"

        p = $.post uri, JSON.stringify data


App.Connector = new Connector
