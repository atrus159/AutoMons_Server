var typeEvent = async_load[? "type"]
switch(typeEvent){
	case network_type_connect:
		ds_list_add(sockets,async_load[? "socket"])
	break
	case network_type_disconnect:
		var disconnected = ds_list_find_index(sockets, async_load[? "socket"])
		if(disconnected != undefined){
		ds_list_delete(sockets, disconnected)
		}
	break;
	case network_type_data:
	var buffer = async_load[? "buffer"]
	buffer_seek(buffer, buffer_seek_start,0)
	handle_packet(buffer)
	break;
}