class App.SitesController extends Monocle.Controller

    elements:
        "#sitesfav ul" : "fav"
        "#sitesrec ul" : "rec"


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

        p = $.get "/sites/"
        p.done (sites) ->
            for s in sites
                App.Site.create s

        p.fail (err) ->
            console.error "Err: ", err


    onSearch: (event) ->
        alert "Searching"


    bindSiteCreate: (site) =>
        console.log "You've created #{site.name}!"
        console.log site

        view = new App.SiteItemView model: site
        # if site.loving
        # TESTING
        if site.name is "hola"
            view.container = @fav
        #else if site.recommended
        else
            view.container = @rec
        # END TESTING
        view.append site


    bindSiteDelete: (site) =>
        alert "You've deleted #{site.name}!"


    bindSiteError: (site) =>
        alert "Site Error spotted, #{site}!"


    viewProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"

