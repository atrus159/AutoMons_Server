for(var i = 0; i<ds_list_size(sockets); i++){
	buffer_seek(send_buffer,buffer_seek_start,0)
	buffer_write(send_buffer,buffer_u8,1)
	buffer_write(send_buffer,buffer_u32,ds_list_size(sockets))
	network_send_packet(ds_list_find_value(sockets,i),send_buffer,buffer_tell(send_buffer))
}