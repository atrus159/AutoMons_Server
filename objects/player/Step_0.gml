
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,1) // daily packet
if(instance_exists(game_manager)){
buffer_write(send_buffer,buffer_u8,game_manager.state)
buffer_write(send_buffer,buffer_u8,game_manager.exportT)
}else{
buffer_write(send_buffer,buffer_u8,0)
buffer_write(send_buffer,buffer_u8,0)
}
buffer_write(send_buffer,buffer_u8,playerId)
for(var i = 0; i<Obj_Server.playerCount; i++){
	var curPlayer = ds_list_find_value(Obj_Server.players,i)
	var curId = curPlayer.playerId
	buffer_write(send_buffer,buffer_u8,curId)
	buffer_write(send_buffer,buffer_u8,curPlayer.money)
	buffer_write(send_buffer,buffer_u8,curPlayer.level)
}
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))

