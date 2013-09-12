'use strict';

angular.module('webApp')
  .controller('LoginCtrl', ['$scope', 'SessionService', 'UserService', function($scope, Session, User) {

    $scope.user = {username: '', password: ''};

    $scope.login = function() {
      $scope.user = Session.save($scope.user, function(success) {
        User.isLogged = true;
        User.username = $scope.user.username;
        $location.path('/');
      }, function(error) {
        $scope.loginError = true;
        User.isLogged = false;
      });
    };
  }]);
