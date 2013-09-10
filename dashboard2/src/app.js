'use strict';

// Declare app level module which depends on filters, and services
angular.module('app', ['app.directives']).
  config(['$routeProvider', function($routeProvider) {
    //$routeProvider.when('/intro', {templateUrl: 'partials/intro.html', controller: IntroCtrl});
    $routeProvider.when('/', {templateUrl: 'src/views/main.html'});
    $routeProvider.otherwise({redirectTo: '/'});
  }]);
