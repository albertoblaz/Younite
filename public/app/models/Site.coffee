#_require ../models/Comment.coffee

class App.Site extends Monocle.Model

    @fields "id", "name", "description", "city", "address", "picture",
            "style", "users", "events", "owner", "loved", "recommended", "comments",


    constructor: ->
        super


    validate: ->
        "id is required"   unless @id
        "name is required" unless @name


    love: (user) ->
        @updateAttributes loved: not @loved
        @


    comment: (data) ->
        com = App.Comment.create data
        @comments.push com
        @updateAttributes comments: @comments
        @


    recommend: ->
        # @recommended.push fid for fid in App.Me.friends
        # @updateAttributes recommended: @recommended
        # @
        App.Me.recommendToFriends @
