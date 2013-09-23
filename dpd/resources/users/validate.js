var _ = require('underscore');
var self = this;
console.log(self);

if (changed('gender') && !validateGender(self.gender)) {
  error('gender', "Must be male or female");
}
if (changed('username') && !validateEmail(self.username)) {
  error('username', "Must be a correct email");
}


function validateEmail(email){
    return (/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(email));
}
function validateGender(gender){
    return _.contains(['male', 'female'], self.gender);
}

function validateLong(value, longMin, longMax){
    console.log(value);
    return (value.length >= longMin && value.length <= longMax);
}
