'use strict';

angular.module('webApp.controllers')
  .controller('LoginCtrl', ['$scope', 'UserService', '$location', function($scope, User, $location) {

    $scope.user = {username: '', password: ''};
    $scope.success = true;

    $scope.login = function() {
      User.login($scope.user, function(success){
        $scope.success = success;
        if(success){
          $location.path('/')
        } else {
          $scope.user.password = '';
        }
      });
    };
  }]);
