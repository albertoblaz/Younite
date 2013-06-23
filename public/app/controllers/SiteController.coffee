class SitesController extends Monocle.Controller

    elements:
        "ul#milista" : "items"


    events:
        "click a[data-action=search]": "onSearch"


    constructor: ->
        super
        @items.html ""

        # Events Bounded
        Site.bind "create", @bindSiteCreate
        Site.bind "delete", @bindSiteDelete
        Site.bind "error", @bindSiteError

        # Routing
        @routes
            "/sites/:id" : @viewProfile
        Monocle.Route.listen()


    onSearch: (event) ->
        alert "Searching"


    bindSiteCreate: (site) =>
        console.log "You've created #{site.name}!"

        view = new SiteItemView model: site
        view.append site


    bindSiteDelete: (site) =>
        alert "You've deleted #{site.name}!"


    bindSiteError: (site) =>
        alert "Site Error spotted, #{site}!"


    viewProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"
