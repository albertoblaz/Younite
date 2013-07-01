class App.SiteItemView extends Monocle.View

    template: """
        <li class="arrow selectable thumb">
            <img src="{{picture}}" class="icon">

            {{#loving}}
            <a href="#" class="accept button right">
                <span class="icon heart"></span>
                <abbr>Loving</abbr>
            </a>
            {{/loving}}
            {{^loving}}
            <a href="#" class="violet button right">
                <span class="icon heart-full"></span>
                <abbr>Love?</abbr>
            </a>
            {{/loving}}

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
