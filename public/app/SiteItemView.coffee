class App.SiteItemView extends Monocle.View

    container: "#sitesfav ul"

    template: """
        <li class="arrow selectable thumb">
            <img src="{{picture}}" class="icon">

            <a href="#" class="accept button right">
                <span class="icon heart"></span>
                <abbr>Loving</abbr>
            </a>

            <a href="#site" data-router="section">
                <strong>{{name}}</strong>
                <small>{{description}}</small>
            </a>
        </li>"""

    # template_url: "assets/templates/siteItemView.mustache"


    # elements:
    #    "button": "love"


    events:
        "tap .button": "onLove"


    onLove: (event) ->
        console.error @model
        @model.love()
