var Faker = require('Faker');
var request = require('request');



var fields = {
  password : '1234',
  username : Faker.Internet.email(),
  displayName : Faker.Name.findName(),
  gender : 'male',
  city : Faker.Address.city(),
  picture : 'https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/41573_195614790506781_1099993371_q.jpg',
  public : true,
  music : [],
  ambient : [],
  maxPrice : Faker.random.number(30),
  birthdate : (new Date()).toString(),
  bio : Faker.Lorem.sentence()
};

console.log(JSON.stringify(fields));
var r = request.post({
  url : 'http://localhost:2403/users',
  body : fields,
  json : true
}, function(error, response, body){
  console.log(error, body);
});


