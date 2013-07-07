class App.SitesController extends Monocle.Controller

    elements:
        "#sitesfav ul" : "fav"
        "#sitesrec ul" : "rec"


    events:
        "tap #search" : "onSearch"
        "load #sites" : "onLoad"


    pendingSites: []


    constructor: ->
        super

        # Events Bounded
        App.Site.bind "create", @bindCreate
        App.Site.bind "error", @bindSiteError
        App.Site.bind "delete", @bindSiteDelete

        p = $.getJSON "/sites/"
        p.done (sites) =>
            console.log sites
            for s in sites
                App.Site.create s
            App.Site.bind "change", @bindChange
                # TODO Efficiency

        p.fail App.Utils.fail


    onLoad: (event) ->
        uniqSites = []
        uniqSites.push s for s in @pendingSites when not uniqSites.contains s

        for s in uniqSites
            s.trigger "removeSiteView"
            @bindCreate s

        @pendingSites = []


    onSearch: (event) ->
        console.log "Searching"


    bindCreate: (site) =>
        console.log "You've created #{site.name}!"
        view = new App.SiteView model: site

        if site.loved
            view.container = @fav
            view.append site
        else if site.recommended
            view.container = @rec
            view.append site


    bindChange: (site) =>
        console.log "You've changed #{site.name}!"
        @pendingSites.push site


    bindSiteDelete: (site) =>
        App.Utils.showError "Deleting the site #{site.name}"
        throw "You've deleted #{site.name}!, #{site}"


    bindSiteError: (site) =>
        App.Utils.showError "Site error spotted, #{site.name}!"