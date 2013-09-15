'use strict';

angular.module('webApp')
  .factory('UserState', function ($http) {
    // Service logic
    // ...

    // Public API here
    return {
      isLogged : false,
      username : '',
      id : '',

      login : function(user){
        var response = $http.post('http://localhost:2403/discouser/login', user);
        return response;
      },
      logout : function(){
        var response = $http.get('http://localhost:2403/discouser/logout');
        return response;
      }
    };
  });
