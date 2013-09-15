'use strict';

angular.module('webApp')
  .controller('LoginCtrl', ['$scope', '$location', 'UserState', function($scope, $location, User) {

    $scope.user = {username: '', password: ''};

    $scope.login = function() {
      var response = User.login($scope.user);
      response.success(function(data, status, headers, config) {
        User.isLogged = true;
        User.username = $scope.user.username;
        User.id = data.uid;
        $location.path('/');
      });
      response.error(function(data, status, headers, config) {
        User.isLogged = false;
        $scope.loginError = true;
        User.username = '';
        User.id = '';
      });
    };
  }]);
