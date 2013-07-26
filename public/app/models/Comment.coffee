class App.Comment extends Monocle.Model

    @fields "id", "comment", "commenter", "commented", "timestamp"


    validate: ->
        "id is required"        unless @id
        "commenter is required" unless @commenter
        "comment is required"   unless @comment
        "too much characters"   unless @comment.length <= 140
