$(function() {

    var items = $('.profile-item'),
        views = $('.view');

    var profileItemsHandler = function () {
        var i = $(this).index();
        var hidden = 'hidden';
        console.log(i);
        views.addClass( hidden ).eq(i).removeClass( hidden );
    };

    items.on('click', profileItemsHandler);

});
