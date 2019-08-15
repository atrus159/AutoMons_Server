var myList = argument0
var level = argument1
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,7) // new shop contents
for(var i = 0; i<global.shopSize; i++){
	var pick = choose("charmander","paras","zubat","weedle","pidgey","pichu")
	ds_list_add(myList,pick)
	buffer_write(send_buffer, buffer_u8,ds_list_find_index(global.pokeLookup,pick)) 
}
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))