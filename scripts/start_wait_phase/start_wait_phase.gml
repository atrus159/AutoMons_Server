randomize()
var boardIndex = 0
ds_list_shuffle(Obj_Server.players)
for(var i = 0; i<global.playerCount-1; i+=2){
	with(ds_list_find_value(Obj_Server.players,i)){
			board = ds_list_find_value(other.game_boards,boardIndex)
			color = false
			if(i+1 <global.playerCount){
			opponent = ds_list_find_value(Obj_Server.players,i+1)
			opponent.opponent = id
			opponent.color = true
			opponent.board = board
			}else{
			opponent = noone
			}
			
			boardIndex ++

	}
}
if(global.playerCount == 1){
	with(ds_list_find_value(Obj_Server.players,0)){
			board = ds_list_find_value(other.game_boards,0)
			color = false
			opponent = noone		
	}	
	
}