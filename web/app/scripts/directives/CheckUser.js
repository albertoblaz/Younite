'use strict';

angular.module('webApp')
  .directive('CheckUser', ['$rootScope', '$location', 'UserService', function ($root, $location, UserSrv) {
    return {
      link: function postLink(scope, element, attrs) {
        $root.$on('$locationChangeStart', function(event, currRoute, prevRoute){
          if (prevRoute.requireLogin && !UserSrv.isLogged) {
            $location.path("/login");
          }
        });
      }
    };
  }]);
