'use strict';

angular.module('webApp')
  .service('UserService', function Userservice() {
    var sdo = {
      isLogged: false,
      username: ''
    };
    console.log(sdo);
    return sdo;
  });
