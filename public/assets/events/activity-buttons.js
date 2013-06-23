
var buttons = $$('#activity').find('.buttonsbar').find('.button');
var list    = $$('#activity-list');


buttons.on('tap', function() {

    var b = $$(this);
    b.toggleClass('secondary');

    var action = (b.hasClass('secondary')) ? 'hide' : 'show';

    switch (b[0].id) {
        case "btn-parties":
            list.find('.mini')[action]();
            b.toggleClass('cancel');
            break;

        case "btn-sites":
            list.find('.thumb')[action]();
            b.toggleClass('yellow');
            break;

        case "btn-friends":
            list.find('.circle')[action]();
            b.toggleClass('accept');
            break;
    }

});
