if(owner != noone){
with(owner){
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,2) //ally piece message
buffer_write(send_buffer,buffer_u8,other.pieceId)
var relX = (other.x-board.x)/4
var relY = (other.y-board.y)/4
if(other.color){
	relX = 70-(other.x-board.x)/4
	relY = 70-(other.y-board.y)/4
}

buffer_write(send_buffer,buffer_u16,relX)
buffer_write(send_buffer,buffer_u16,relY)
var obj_name = object_get_name(other.object_index)
var type_index = ds_list_find_index(global.pokeLookup,obj_name)
buffer_write(send_buffer,buffer_u8,type_index)
var sendFacing = other.facing
buffer_write(send_buffer,buffer_u8,sendFacing)
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))
}
}
if(opponent!=noone){
with(opponent){
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,3) //enemy piece message
buffer_write(send_buffer,buffer_u8,other.pieceId)
relX = 70-(other.x-board.x)/4
relY = 70-(other.y-board.y)/4
if(other.color){
	var relX = (other.x-board.x)/4
	var relY = (other.y-board.y)/4
}

buffer_write(send_buffer,buffer_u16,relX)
buffer_write(send_buffer,buffer_u16,relY)
var obj_name = object_get_name(other.object_index)
var type_index = ds_list_find_index(global.pokeLookup,obj_name)
buffer_write(send_buffer,buffer_u8,type_index)
var sendFacing = (other.facing+2) mod 4
buffer_write(send_buffer,buffer_u8,sendFacing)

network_send_packet(socket,send_buffer,buffer_tell(send_buffer))
}
}