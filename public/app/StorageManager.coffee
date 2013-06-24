class StorageManager

    users: [
        "name" : "asd"
        "pass" : "asd123"
    ]

    login: (data) ->
        data.pass = @encrypt data.pass
        user = @lookup(data)


    signup: (data) ->
        data.pass = @encrypt data.pass
        user = @add(data)


    add: (user) ->
        @users.push user


    encrypt: (pass) ->
        # Pending to replace this by an authentic, secure algorithm
        pass += "123"


    lookup: (data) ->
        arr = @users.filter (u) -> data.name is u.name and data.pass is u.pass
        arr[0]


App.StorageManager = new StorageManager
