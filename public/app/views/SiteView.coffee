class SiteItemView extends Monocle.View

    container: "#milista"

    template: """
        <li>
            <strong>{{name}}</strong>
            <small>{{style}}</small>
        </li>"""

    # template_url: "templates/siteItem.mustache"


    elements:
        "strong": "name"


    events:
        "click li": "onClick"


    onClick: (event) ->
        console.error "Current Item", @model


    exampleMethod: -> @name.html "new content"
