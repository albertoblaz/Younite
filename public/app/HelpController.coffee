class App.HelpController extends Monocle.Controller

    elements:
        "#query": "query"

    events:
        "tap #send-question": "onTap"


    onTap: ->
        text = @query.val()
        @sendQuestion text if text


    sendQuestion: (text) ->
        # sending the query
        # analyze respond

        # TESTING
        res = false
        console.log text
        # END TESTING

        Lungo.Notification.success(
            "Question sent!",                                       # Title
            "You will receive a response in the activity view",     # Description
            "check",                                                # Icon
            3,                                                      # Time on screen
            () -> {  }                                              # Callback function
        ) if res
