class App.AuthStorage

    KEYS:
        users: 'users'


    constructor: (@users = []) ->
        json = window.localStorage.getItem @KEYS.users
        data = JSON.parse json
        @users = data if data

        # TESTING
        @signup
            username: "asd"
            password: "asd123"
        console.log @users
        # END TESTING
        @


    login: (user, success, failure) ->
        if @lookup user then success? user else failure? user


    signup: (user) ->
        if not @lookup user
            @users.push user
            json = JSON.stringify @users
            window.localStorage.setItem @KEYS.users, json


    lookup: (user) ->
        arr = @users.filter (u) -> user.username is u.username and user.password is u.password
        throw App.Exceptions.TooMuchUsersStorage if arr.length > 1
        arr[0]

