'use strict';

angular.module('webApp')
  .controller('LoginCtrl', ['$scope', 'UserService', function($scope, User) {

    $scope.user = {username: '', password: ''};

    $scope.login = function() {
      var success = false;
      success = User.login($scope.user);
      if(success) $location.path('/')
      $scope.success = success;
    };
  }]);
