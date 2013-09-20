'use strict';

angular.module('webApp.controllers')
  .controller('SignupCtrl', ['$scope', 'UserResource', function ($scope, User) {
    $scope.user = {};
    $scope.signup = function(){
      User.save($scope.user);
    }
  }]);
