var buffer = argument0
var messageId = buffer_read(buffer,buffer_u8)
switch(messageId){
	case 1:
		var mx = buffer_read(buffer,buffer_u32)
		var my = buffer_read(buffer,buffer_u32)
		instance_create_depth(mx,my,0,click)
	break;
}