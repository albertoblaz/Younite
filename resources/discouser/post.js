//if(!internal) cancel("Not Authorized", 401);

protect('role');
protect('site');

this.role = 'site';

console.log(this.site);

