//if(!internal) cancel("Not Authorized", 401);

protect('role');
protect('site');
protect('init');

this.role = 'site';
