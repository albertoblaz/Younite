class App.SitesController extends Monocle.Controller

    elements:
        "#sitesfav ul" : "fav"
        "#sitesrec ul" : "rec"


    events:
        "click a[data-action=search]": "onSearch"


    constructor: ->
        super

        # Events Bounded
        # App.Site.bind "create", @bindSiteCreate
        App.Site.bind "change", @bindSiteChange
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


    onSearch: (event) =>
        console.log "Searching"


    # bindSiteCreate: (site) =>
    #     console.log "You've created #{site.name}!"
    #     console.log site
        
    #     view = new App.SiteView model: site
    #     # if site.loving
    #     # TESTING
    #     if site.name is "hola"    
    #         site.loving = true
    #         view.container = @fav
    #     #else if site.recommended
    #     else
    #         site.loving = false
    #         view.container = @rec
    #     # END TESTING
    #     view.append site
        

    bindSiteChange: (site) =>
        console.log "You've change #{site.name}!"
        view = new App.SiteView model: site

        # TESTING asi se ve bien como se alterna la vista entre las dos listas
        # if site.loving is true
        #     view.container = @fav 
        # else
        #     view.container = @rec 
        # view.append site

        if site.loving
            view.container = @fav 
            view.append site
        else if site.recommended
            view.container = @rec
            view.append site


    bindSiteDelete: (site) =>
        console.log "You've deleted #{site.name}!"


    bindSiteError: (site) =>
        console.log "Site Error spotted, #{site}!"


    viewProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"
