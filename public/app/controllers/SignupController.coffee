class App.SignupController extends Monocle.Controller

    elements:
        "#signup-name"     : "name"
        "#signup-password" : "pass"
        "#signup-realname" : "realname"
        "#signup-gender"   : "gender"

    events:
        "tap .btn-signup" : "onSignup"


    checkData: ->
        # TODO pending for improvements
        data = {}
        for e in ['name', 'pass', 'realname', 'gender']
            str = @[e].val()
            if not str
                @showError()
                break
            else
                data[e] = str
        data


    onSignup: (event) ->
        event.preventDefault()
        data = @checkData()
        res = App.StorageManager.signup data
        if not res
            @showError()
        else
            @showSuccess()


    showSuccess: ->
        Lungo.Notification.success(
            "Success",                                  # Title
            "User signed up successfully!",             # Description
            "check",                                    # Icon
            2,                                          # Time on screen
            () -> Lungo.Router.section('#activity')     # Callback
        )


    showError: ->
        Lungo.Notification.error(
            "Error",                                    # Title
            "Signup failed :(",                         # Description
            "cancel",                                   # Icon
            2                                           # Time on screen
        )

