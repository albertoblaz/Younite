class App.ActivityController extends Monocle.Controller

    elements:
        ".btn-filter"    : "buttons"
        "#activity-list" : "list"

    events:
        "tap .btn-filter" : "onTap"


    onTap: (event) ->
        target = event.currentTarget
        b = $$ target
        b.toggleClass 'secondary'

        id = target.id.slice 4   # "btn-party" -> "party"
        switch id
            when "party"  then b.toggleClass 'cancel'
            when "site"   then b.toggleClass 'yellow'
            when "friend" then b.toggleClass 'accept'

        action = if b.hasClass 'secondary' then 'hide' else 'show'
        elems = @list.find ".#{id}"
        elems[action]()
