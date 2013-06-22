if(!internal && (!me || !isMe(this.id))) cancel("Not Authorized", 403);

protect('role');

if(!internal){
    protect('sites');
}
