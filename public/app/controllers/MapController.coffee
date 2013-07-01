class App.MapController extends Monocle.Controller

    notified: false

    events:
        "load #map": "onLoad"


    onLoad: (event) ->
        unless @notified
            Lungo.Notification.confirm(
                icon: "pushpin"

                title: "¿Find the nearest sites?"

                description: "Map lets you know what are the closest places at your current position. Do you want to find new sites when entering in this window? (You could change this on settings)"

                accept:
                    icon: 'check'
                    label: 'Accept and Find'
                    callback: @onAccept

                cancel:
                    icon: "multiply"
                    label: "Don't allow"
                    callback: @onCancel
            )


    onAccept: ->
        Lungo.Notification.hide()

        notif = ->
            # Query current geo-location
            # Query Google
            Lungo.Notification.show()

            # When results are gotten, then the notification must be hidden
            setTimeout ->
                Lungo.Notification.hide()
            , 3000

        setTimeout notif, 300
        @notified = true


    onCancel: ->
        # Change privacy settings
        @notified = true
