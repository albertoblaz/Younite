if(!me || !isMe(this.owner)) cancelAll("Unauthorized", 403);
if(!me.role === 'site') cancel("You must be a disco user", 401);
