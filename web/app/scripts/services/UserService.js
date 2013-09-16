'use strict';

angular.module('webApp')
  .factory('UserService', ['$http', function Userservice($http) {

    var api = {};

    var user = {id : '', username : '', logged : false};

    api.login = function(userData){
      $http.post('http://localhost:2403/discouser/login')
        .success(function(data){
          user.id = data.uid;
          user.logged = true;
          user.username = userData.username;
          //$cookie.put("younite-user-logged", user);
          return true;
        })
        .error(function(){
          user = {id : '', username : '', logged : false};
          //$cookie.remove("younite-user-logged");
          return false;
        });
    };

    api.logout = function(){
      $http.get('http://localhost:2403/discouser/logout')
        .success(function(){
          user = {id : '', username : '', logged : false};
          //$cookie.remove("younite-user-logged");
          return true;
        });
    };

    api.getId = function(){
      return user.id;
    };

    api.isLogged = function(){
      return user.logged;
    };

    console.log(api);

    return api;
  }]);
