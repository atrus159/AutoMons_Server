var myList = argument0
var level = argument1
buffer_seek(send_buffer,buffer_seek_start,0)
buffer_write(send_buffer, buffer_u8,7) // new shop contents
for(var i = 0; i<ds_list_size(myList); i++){
	var pokeName = ds_list_find_value(myList,i)
	var compArray = ds_map_find_value(global.componentLookup,pokeName)
	ds_list_add(global.draftBucket[compArray[2]-1],pokeName)
}
ds_list_clear(myList)
for(var i = 0; i<global.shopSize; i++){
	var rand = random(100)
	var probs = get_level_prob(level)
	var tier = -1
	if(rand<=probs[0]){
		tier = 0	
	}else if(rand <= probs[0]+probs[1]){
		tier = 1	
	}else if(rand<= probs[0]+probs[1]+probs[2]){
		tier = 2
	}else if(rand<= probs[0]+probs[1]+probs[2]+probs[3]){
		tier = 3
	}else{
		tier = 4
	}
	ds_list_shuffle(global.draftBucket[tier])
	var pick = ds_list_find_value(global.draftBucket[tier],0)
	ds_list_delete(global.draftBucket[tier],0)
	ds_list_add(myList,pick)
	buffer_write(send_buffer, buffer_u8,ds_list_find_index(global.pokeLookup,pick)) 
}
network_send_packet(socket,send_buffer,buffer_tell(send_buffer))