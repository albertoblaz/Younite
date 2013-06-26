class Auth

    storage : new App.AuthStorage
    remote  : new App.AuthRemote


    login: (data, success, failure) ->
        return false if not @check data

        # Verify data previously saved locally. If not, verify remote data on server
        fail = () => @remote.login data, success, failure
        @storage.login data, success, fail



    signup: (data) ->
        return false if not @check data

        ok  = @storage.signup data
        ok2 = @remote.signup data
        ok and ok2


    check: (data) ->
        valid = data.username != "" and data.password != ""
        if not valid
            throw App.Exceptions.AuthWrongFields
        else
            data.password = @encrypt data.password
        valid


    encrypt: (pass) ->
        # TODO Pending to replace this by an authentic, secure algorithm
        pass += "123"


App.Auth = new Auth
