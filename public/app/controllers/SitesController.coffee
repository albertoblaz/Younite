class App.SitesController extends Monocle.Controller

    elements:
        "#sitesfav ul" : "fav"
        "#sitesrec ul" : "rec"


    events:
        "click a[data-action=search]": "onSearch"


    constructor: ->
        super

        # Events Bounded
        # App.Site.bind "create", @renderSite
        App.Site.bind "error", @bindSiteError
        App.Site.bind "change", @renderSite
        App.Site.bind "delete", @bindSiteDelete

        p = $.getJSON "/sites/"
        p.done (sites) ->
            console.log sites
            for s in sites
                App.Site.create s
                # TODO Efficiency

        p.fail App.Utils.fail


    onSearch: (event) =>
        console.log "Searching"


    renderSite: (site) =>
        console.log "You've rendered #{site.name}!"
        view = new App.SiteView model: site

        if site.loved
            view.container = @fav
            view.append site
        else if site.recommended
            view.container = @rec
            view.append site


    # bindSiteCreate: (site) =>
    #     console.log "You've created #{site.name}!"
    #     view = new App.SiteView model: site

    #     if site.loved
    #         view.container = @fav
    #         view.append site
    #     else if site.recommended
    #         view.container = @rec
    #         view.append site


    # bindSiteChange: (site) =>
    #     console.log "You've change #{site.name}!"
    #     view = new App.SiteView model: site

    #     if site.loved
    #         view.container = @fav
    #         view.append site
    #     else if site.recommended
    #         view.container = @rec
    #         view.append site


    bindSiteDelete: (site) =>
        console.log "You've deleted #{site.name}!"


    bindSiteError: (site) =>
        console.log "Site Error spotted, #{site}!"


    viewSiteProfile: (params) ->
        console.log "View the profile of the site: #{params.id}"
        Lungo.Router.section "#site"

