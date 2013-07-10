#_require ../auxiliary/Connector.coffee
#_require ../models/Site.coffee
#_require ../views/CommentView.coffee

class App.SiteController extends Monocle.Controller

    elements:
        "#name"        : "name"
        "#picture"     : "picture"

        "#music"       : "music"
        "#ambient"     : "ambient"
        "#age"         : "age"
        "#maxprice"    : "maxprice"

        "#description" : "description"
        "#comments"    : "comments"

        "#btn-love"    : "love"


    events:
        "tap #btn-love"      : "onLove"
        "tap #btn-comment"   : "onComment"
        "tap #btn-recommend" : "onRecommend"


    currentSite: null


    constructor: ->
        super
        App.Site.bind "comment", @bindComment

        # Routing
        @routes
           "/sites/:id" : @loadProfile
        Monocle.Route.listen()


    onLove: (event) ->
        @currentSite.love()
        @renderLove @currentSite


    onComment: (event) ->
        # Launch a modal dialog
        # ok = Lungo.Notification.
        # if ok then
        #     @currentSite.comment text


    onRecommend: (event) ->



    bindComment: (site) ->



    loadProfile: (params) ->
        site = App.Site.findBy "id", params.id
        site = @download params.id if not site

        @render site
        @currentSite = site
        Lungo.Router.section "#site"


    render: (site) ->
        @renderInfo site
        @renderComments site
        @renderLove site


    renderInfo: (site) ->
        @name.text site.name
        @picture[0].src = site.picture


    renderComments: (site) ->
        do c.remove for c in @comments.children ".arrow"

        for c in site.comments
            view = new App.CommentView model: c
            view.container = @comments
            view.append c


    renderLove: (site) ->
        label = @love.find "abbr"
        icon  = @love.find ".icon"

        if site.attributes().loved
            label.text "Loving"
            icon.removeClass("heart-full").addClass("heart")
        else
            label.text "Love?"
            icon.removeClass("heart").addClass("heart-full")


    download: (id) ->
        console.log "download site #{id}"
        # GET site usando el id y mostrar datos
        data = App.Connector.sites.get id
        App.Site.create data

