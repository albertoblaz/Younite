'use strict';

angular.module('webApp.controllers')
  .controller('MainCtrl', function ($scope, $http) {

    $http({method: 'GET', url: '/discouser/me'}).

      success(function(data, status, headers, config) {
        $scope.response = data;
      }).
      error(function(data, status, headers, config) {
         console.log(headers);
        $scope.response = status;
      });
  });
