class Connector

    URIS:
        login : "/users/login"
        logout: "/users/logout"
        signup: "/users"


    login: (user) ->
        @auth @URIS.login, user


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
