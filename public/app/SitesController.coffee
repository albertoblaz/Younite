class App.SitesController extends Monocle.Controller

    elements:
        "#sitesfav ul" : "fav"
        "#sitesrec ul" : "rec"
        "#sitesall ul" : "all"


    events:
        "click a[data-action=search]": "onSearch"


    constructor: ->
        super

        # Events Bounded
        App.Site.bind "create", @bindSiteCreate
        App.Site.bind "delete", @bindSiteDelete
        App.Site.bind "error", @bindSiteError

        # Routing
        # @routes
        #    "/sites/:id" : @viewProfile
        # Monocle.Route.listen()


    onSearch: (event) ->
        alert "Searching"


    bindSiteCreate: (site) =>
        console.log "You've created #{site.name}!"

        view = new App.SiteItemView model: site
        view.append site


    bindSiteDelete: (site) =>
        alert "You've deleted #{site.name}!"


    bindSiteError: (site) =>
        alert "Site Error spotted, #{site}!"


    viewProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"

