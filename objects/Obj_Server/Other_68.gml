var typeEvent = async_load[? "type"]
switch(typeEvent){
	case network_type_connect:
		var newPlayer = instance_create_depth(0,0,0,player)
		newPlayer.socket = async_load[? "socket"]
		ds_list_add(players,newPlayer)
		playerIdCount ++
	break
	case network_type_disconnect:
		var dcSocket = async_load[? "socket"]
		for(var i = 0; i<ds_list_size(players); i++){
			var dcPlayer = ds_list_find_value(players,i)
			if(dcPlayer.socket == dcSocket){
				ds_list_delete(players,i)
				instance_destroy(dcPlayer)
				break;
			}
		}
	break;
	case network_type_data:
	var buffer = async_load[? "buffer"]
	buffer_seek(buffer, buffer_seek_start,0)
	var buffSocket = async_load[? "id"]
	for(var i = 0; i<ds_list_size(players); i++){
		var buffPlayer = ds_list_find_value(players,i)
		if(buffPlayer.socket == buffSocket){
			with(buffPlayer){
				handle_packet(buffer)
			}
			break;
			
		}
	}
	break;
}