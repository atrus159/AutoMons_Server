var buffer = argument0
var messageId = buffer_read(buffer,buffer_u8)
switch(messageId){
	case 10: // player send pokemon
		while(buffer_tell(buffer)<buffer_get_size(buffer)){
			var type = buffer_read(buffer,buffer_u8)
			var pokeType = noone
			if(type == 111){
				pokeType = pokemon
			}
			var pX = buffer_read(buffer,buffer_u8)
			var pY = buffer_read(buffer,buffer_u8)
			instance_create_depth(pX*50,pY*50,0,pokeType)
		}
	break;
}