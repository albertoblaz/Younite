#_require auxiliary/Delegate.coffee

signupRight = ->
    App.Storage.signup
        username: "albertoblaz@gmail.com"
        password: "albertoblaz123"

signupWrong = ->
    App.Storage.signup
        username: "albertobqlaz@gmail.com"
        password: "albertoblaz123"

do window.localStorage.clear
do signupRight
# do signupWrong
