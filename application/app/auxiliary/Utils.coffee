#_require ../auxiliary/Messages.coffee
#_require ../auxiliary/Native.coffee

App.Utils = {}

App.Utils.showSuccess = (message, callback) ->
    Lungo.Notification.success(
        "Success",                                  # Title
        message,                                    # Description
        "check",                                    # Icon
        2,                                          # Time on screen
        callback?()                                 # Callback
    )


App.Utils.showError = (message) ->
    Lungo.Notification.error(
        "Error",        # Title
        message,        # Description
        "cancel",       # Icon
        2               # Time on screen
    )


App.Utils.fail = (xhr) ->
    console.log "fail", xhr
    json = JSON.parse xhr.responseText
    if typeof json is "object"
        App.Utils.showError "#{k} #{v}" for k, v of json.errors if json.errors
        App.Utils.showError json.message if json.message
    else if typeof json is "string"
        App.Utils.showError "#{json}"


App.Utils.online = ->
    # Determine if the device has internet access
    true
