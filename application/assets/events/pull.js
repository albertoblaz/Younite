
var createPull = function(view) {

    var pull_parties = new Lungo.Element.Pull(view, {

        onPull    : "Pull down to refresh",
        onRelease : "Release to get new data",
        onRefresh : "Refreshing...",

        callback  : function () {
            return setTimeout(function() {
                return pull_parties.hide();
            }, 600);
        }

    });

    return pull_parties;

};

createPull('section#notifications article');
