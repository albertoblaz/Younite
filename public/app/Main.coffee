signupRight = ->
    App.Storage.signup
        username: "albertoblaz@gmail.com"
        password: "albertoblaz123"

signupWrong = ->
    App.Storage.signup
        username: "albertobqlaz@gmail.com"
        password: "albertoblaz123"

window.localStorage.clear()
# signupRight()
# signupWrong()