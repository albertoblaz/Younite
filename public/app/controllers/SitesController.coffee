#_require ../auxiliary/Utils.coffee
#_require ../auxiliary/Connector.coffee
#_require ../models/Site.coffee
#_require ../views/SiteView.coffee

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

        # GET sites from Connector
        p = $.getJSON "/sites/"
        p.done (sites) =>
            console.log sites
            for s in sites
                # TODO Temporal hasta que la API añada los comments
                s.comments = []
                s.recommended = []
                site = App.Site.create s

            # TESTING
            site.comment
                id: "1"
                comment: "Comentario de prueba"
                commenter: App.Me
                commented: site
            # END TESTING

            App.Site.bind "change", @bindChange     # TODO Efficiency

        p.fail App.Utils.fail


    onLoad: (event) ->
        for site in @pendingSites
            site.trigger "removeSiteView"
            @bindCreate site

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
        @pendingSites.push site if not @pendingSites.contains site


    bindSiteDelete: (site) =>
        App.Utils.showError "Deleting the site #{site.name}"
        throw "You've deleted #{site.name}!, #{site}"


    bindSiteError: (site) =>
        App.Utils.showError "Site error spotted, #{site.name}!"
