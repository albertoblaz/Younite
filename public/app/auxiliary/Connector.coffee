#_require ../auxiliary/Utils.coffee
#_require ../models/User.coffee

class Connector

    URIS:
        me     : "/users/me"
        login  : "/users/login"
        logout : "/users/logout"
        signup : "/users"


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


    downloadMe: =>
        p = $.get @URIS.me
        p.done (me) =>
            console.log me
            App.Me = App.User.create me
            do @downloadFriends

        p.fail App.Utils.fail


    downloadFriends: =>
        iter = 0
        nmax = App.Me.friends.length
        arr  = []

        for fid in App.Me.friends
            q = $.get "/users/#{fid}"
            q.done (data) =>
                console.log data
                arr.push App.User.create data
                iter++
                if iter is nmax
                    App.Me.updateAttributes friends: arr
                    do App.Delegate.boot


App.Connector = new Connector
