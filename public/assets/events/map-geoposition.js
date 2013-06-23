
var notificationShowed = false;

$$('#map').on('load', function () {

    if (! notificationShowed) {

        Lungo.Notification.confirm({
            icon: "pushpin",
            title: "¿Find the nearest sites?",
            description: "Map lets you know what are the closest places at your current position. Do you want to find new sites when entering in this window? (You could change this on settings)",

            accept: {
                icon: 'check',
                label: 'Accept and Find',
                callback: function() {
                    Lungo.Notification.hide();

                    setTimeout(function() {
                        // Query current geo-location
                        // Query Google
                        Lungo.Notification.show();

                        // When results are gotten, then the notification must be hidden
                        setTimeout(function() {
                            Lungo.Notification.hide();
                        }, 3000);

                    }, 300);

                    // Not show this again
                    notificationShowed = true;
                }
            },

            cancel: {
                icon: "multiply",
                label: "Don't allow",
                callback: function() {
                    // Change privacy settings

                    // Not show this again
                    notificationShowed = true;
                }
            }
        });

    }

});
