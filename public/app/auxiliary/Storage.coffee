class Storage

    KEYS:
        users: 'users'


    constructor: (@users = []) ->
        @retrieve()


    retrieve: ->
        json = window.localStorage.getItem @KEYS.users
        data = JSON.parse json if json
        @users = data if data
        @


    login: (user, success, failure) ->
        if @lookup user then success? user else failure? user


    signup: (user) ->
        if not @lookup user

            # TODO
            # user.password = @encrypt user.password

            @users.push user
            json = JSON.stringify @users
            window.localStorage.setItem @KEYS.users, json


    lookup: (user) ->
        arr = @users.filter (u) -> user.username is u.username and user.password is u.password
        throw App.Exceptions.TooMuchUsersStorage if arr.length > 1
        arr[0]

App.Storage = new Storage
