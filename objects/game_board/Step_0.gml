if(!decided && game_manager.state == 2 && bluePlayer != noone){
	

var monList = ds_list_create()
var n = 0
with(pokemon){
	if(point_in_rectangle(x,y,other.x-5,other.y-5,other.x+75,other.y+75)){
		ds_list_add(monList,id)
		n++
	}
}
var blueAlive = false
var redAlive = false
for(var i = 0; i<n; i++){
	var curPoke = ds_list_find_value(monList,i)
	if(curPoke.owner == bluePlayer){
		blueAlive = true
	}
	if(curPoke.owner == redPlayer){
		redAlive = true
	}
}

if(!redAlive && !blueAlive){
	if(redPlayer != noone){
	redPlayer.won = 2
	}
	bluePlayer.won = 2
	decided = 1
}else if(!redAlive && blueAlive){
	if(redPlayer != noone){
	redPlayer.won = 0
	}
	bluePlayer.won = 1
	decided = 1
}else if(redAlive && !blueAlive){
	if(redPlayer != noone){
	redPlayer.won = 1
	}
	bluePlayer.won = 1
	decided = 1
}
ds_list_destroy(monList)
}