class App.Comment extends Monocle.Model

    @fields "id", "comment", "commenter", "commented", "timestamp"


    validate: ->
        "id is required"        unless @id
        "comment is required"   unless @comment
        "commenter is required" unless @commenter
