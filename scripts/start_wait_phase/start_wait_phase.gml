randomize()
var boardIndex = 0
ds_list_shuffle(Obj_Server.players)
for(var i = 0; i<Obj_Server.playerCount; i+=2){
	with(ds_list_find_value(Obj_Server.players,i)){
			board = ds_list_find_value(other.game_boards,boardIndex)
			color = false
			if(i+1 <Obj_Server.playerCount){
			opponent = ds_list_find_value(Obj_Server.players,i+1)
			opponent.opponent = id
			opponent.color = true
			opponent.board = board
			}else{
			opponent = noone
			var fakeOp = ds_list_find_value(Obj_Server.players,0)
			if(fakeOp == id){
				fakeOp = ds_list_find_value(Obj_Server.players,1)
			}
			reciveFrom = fakeOp
			fakeOp.sendTo = id
			}
			
			boardIndex ++

	}
}
if(Obj_Server.playerCount == 1){
	with(ds_list_find_value(Obj_Server.players,0)){
			board = ds_list_find_value(other.game_boards,0)
			color = false
			opponent = noone		
	}	
	
}

with(player){
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,6) //update opponents
var op = 0
var fake = 0
if(opponent == noone){
	if(reciveFrom != noone){
		op = reciveFrom.playerId	
	}
	fake = 1
}else{
	op = opponent.playerId	
}
buffer_write(send_buffer, buffer_u8,op)
buffer_write(send_buffer, buffer_u8,fake)
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))
}