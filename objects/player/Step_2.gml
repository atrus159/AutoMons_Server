if(create_flag){
	create_flag = 0	
	with(player){
		buffer_seek(other.send_buffer,buffer_seek_start,0)
		buffer_write(other.send_buffer, buffer_u8,4) // server new player name
		buffer_write(other.send_buffer,buffer_u8,playerId)
		buffer_write(other.send_buffer,buffer_string,name)
		network_send_packet(other.socket,other.send_buffer,buffer_tell(other.send_buffer))
	}
}