'use strict';

var app = angular.module('webApp', ['webApp.controllers', 'webApp.services', 'webApp.directives', 'ui.bootstrap']);

app.config(function ($routeProvider, $httpProvider) {

  $httpProvider.defaults.withCredentials = true;
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];

  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl',
      requireLogin: true
    })
    .when('/login', {
      templateUrl: 'views/login.html',
      controller: 'LoginCtrl',
      requireLogin: false
    })
    .when('/signup', {
      templateUrl: 'views/signup.html',
      requireLogin: false
    })
    .when('/settings', {
      templateUrl: 'views/settings.html',
      requireLogin: true
    })
    .otherwise({
      redirectTo: '/'
    });
});


app.run(['$rootScope', '$location', 'UserService', function ($root, $location, UserSrv) {

    $root.templates = {
      "header" : "views/tplHeader.html",
      "navigation" : "views/tplNavigation.html",
      "footer" : "views/tplFooter.html"
    }

    $root.$on('$routeChangeStart', function(event, currRoute){
      UserSrv.init(function(){
        if (currRoute.requireLogin && !UserSrv.getUser().logged) {
            $location.path('/login');
        }
      });
    });
  }]);
