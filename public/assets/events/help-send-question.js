
Lungo.dom('#send-question').on('tap', function() {

    Lungo.Notification.success(
        "Question sent!",                                       //Title
        "You will receive a response in the activity view",     //Description
        "check",                                                //Icon
        5,                                                      //Time on screen
        function() { }                                          //Callback function
    );

});
