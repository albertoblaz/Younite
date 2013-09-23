'use strict';

angular.module('webApp.controllers')
  .controller('SignupCtrl', ['$scope', 'UserResource', function ($scope, User) {
    $scope.user = {};
    $scope.signup = function(){
      console.log($scope.user);
      User.save($scope.user);
    }
  }]);
