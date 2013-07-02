Lungo.ready ->

    console.log "Ready!!"
    # window.localStorage.clear()

    """
    App.Auth.signup
        username: "asd"
        password: "asd"
    """

    new App.LoginController "section#login"
    new App.SignupController "section#signup"
