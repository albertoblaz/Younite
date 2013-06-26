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

    new App.ActivityController "section#activity"
    new App.SitesController "section#sites"
    new App.MapController "section#map"
    new App.HelpController "section#help"

    for n in [1..4]
        App.Site.create
            name: "Kapital #{n}"
            description: "Lo mejor de Madrid"
            picture: "assets/images/logos/kapital.png"
