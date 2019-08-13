with(player){
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,5) // start signal
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))
}
room_goto_next()