
var nav = function (action) { Lungo.View.Aside[action]('#nav'); };

/*
 * Swiping to show or hide the Navigation Menu
 */
var swipeGestureNav = function () {
    $$('section.main')
        .on('swipeLeft',  function() { nav('hide'); })
        .on('swipeRight', function() { nav('show'); });

    $$('aside#nav').on('swipeLeft', function() { nav('hide'); });
};

swipeGestureNav();

/*
// Swiping left/right effect in views with multiple articles
var swipeGestureMultipleViews = function () {
    var sections = $$('section');
    for (var i = 0, s, len = sections.length; i < len; i++) {
        s = sections.get(i);

        if ( s.find('.groupbar') ) {
            var left = 1;
            s.on('swipeLeft',  function() { auxSwipeAnimation(s, left); });
            s.on('swipeRight', function() { auxSwipeAnimation(s, ! left);   });
        }
    }
};


// Auxiliary function to perform the swipe animation
// Filter the old 'active' article and update the new one
var auxSwipeAnimation = function (section, left) {
    var res = left || -1;          // If swiping left then show the i+1 article. Else, i-1

    var articles = section.find('article');
    for (var i = 0, len = articles.length; i < len; i++) {

        if (articles.get(i).hasClass('.active')) {
            if (i === 0 && ! left) {
                nav('show');

            } else {
                articles.get(i).removeClass('active');
                articles.get(i + res).addClass('active');
            }

            break;
        }
    }
};
*/
