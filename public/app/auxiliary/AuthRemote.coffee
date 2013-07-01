class App.AuthRemote

    URIS:
        login : "/users/login"
        logout: "/users/logout"
        signup: "/users/signup"


    login: (user, success, failure) ->
        @post @URIS.login, user, success, failure


    logout: (user) ->
        @post @URIS.logout


    signup: (user, success, failure) ->
        @post @URIS.signup, user, success, failure


    post: (uri, user, success, failure) ->
        console.log uri, user

        onSucc = (data) ->
            console.log "Callback normal", data
            if data then success? data else failure? data

        onFail = (err) ->
            console.log "Callback de error", err
            failure? err

        # jQuery works!
        p = $.post uri, user
        p.done onSucc
        p.fail onFail
