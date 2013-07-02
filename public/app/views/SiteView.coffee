class App.SiteView extends Monocle.View

    template_url: "app/templates/SiteView.mustache"

    # elements:
    #    "button": "love"

    events:
        "tap .button" : "onLove"
    	"tap li"      : "onTap"


    onTap: (event) ->
    	console.log "onTap"
    	# App.Currents.Site.update @model.id


    onLove: (event) ->
    	console.log "onLove"
    	@model.toggleLove()
    	@remove()
