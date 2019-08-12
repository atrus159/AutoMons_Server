buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,1) // daily packet
buffer_write(send_buffer,buffer_u8,game_manager.state)
buffer_write(send_buffer,buffer_u8,game_manager.exportT)
for(var i = 0; i<global.playerCount; i++){
	var curPlayer = ds_list_find_value(Obj_Server.players,i)
	var curName = curPlayer.name
	buffer_write(send_buffer,buffer_u32,string_ord_at(curName,1))	
	buffer_write(send_buffer,buffer_u32,string_ord_at(curName,2))
	buffer_write(send_buffer,buffer_u32,string_ord_at(curName,3))
}
	buffer_write(send_buffer,buffer_u32,1)
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))