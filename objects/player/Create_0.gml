socket = noone
send_buffer = buffer_create(1024,buffer_fixed,1)
randomize()
name = ""
playerId = Obj_Server.playerIdCount 
board = noone
opponent = noone
color = false
//false is blue, true is red
create_flag = true
sendTo = noone
reciveFrom = noone
level = 1
money = 1
shopContents = ds_list_create()
freeReroll = 1
myPurchased = ds_list_create()
xp = 0
won = -1
winStreak = 0
loseStreak = 0
maxWin = 5
maxLose = 2