var buffer = argument0
var messageId = buffer_read(buffer,buffer_u8)
switch(messageId){
	case 10: // player send pokemon
		while(buffer_tell(buffer)<buffer_get_size(buffer)){
			var type = buffer_read(buffer,buffer_u8)
			var typeIndex = ds_list_find_value(global.pokeLookup,type)
			var pokeType = asset_get_index(typeIndex)
			var pX = buffer_read(buffer,buffer_u8)
			var pY = buffer_read(buffer,buffer_u8)
			var relX = 10*pX+board.x
			var relY = 10*pY+board.y+40
			if(color){
				relX = 10*(7-pX)+board.x
				relY = 10*(3-pY)+board.y
			}
			var piece = instance_create_depth(relX,relY,0,pokeType)
			piece.color = color
			piece.opponent = opponent
			piece.board = board
			piece.owner = id
			piece.pieceId = global.pieceId
			global.pieceId++
			if(sendTo != noone){
				relX = 10*(7-pX)+sendTo.board.x
				relY = 10*(3-pY)+sendTo.board.y
				piece = instance_create_depth(relX,relY,0,pokeType)
				piece.color = true
				piece.opponent = sendTo
				piece.board = sendTo.board
				piece.owner = noone
				piece.pieceId = global.pieceId
				global.pieceId++
			}
		}
	break;
	case 11: //player update name
		name = buffer_read(buffer,buffer_string)
		with(player){
			buffer_seek(send_buffer,buffer_seek_start,0)
			buffer_write(send_buffer, buffer_u8,4) // server new player name
			buffer_write(send_buffer,buffer_u8,other.playerId)
			buffer_write(send_buffer,buffer_string,other.name)
			network_send_packet(socket,send_buffer,buffer_tell(send_buffer))
		}
	break;
	case 12: //player reroll request
		if(money>=2 || freeReroll){
			if(freeReroll){
				freeReroll = 0	
			}else{
				money -=2	
			}
			get_shop_contents(shopContents,level)
		}
	break;
	case 13: //player buy request
		var pokeBuy = buffer_read(buffer,buffer_u8)
		var pokeType = ds_list_find_value(global.pokeLookup,pokeBuy)
		var localIndex = ds_list_find_index(shopContents,pokeType)
		var canBuy = (money>0)
		if(localIndex != -1 && canBuy){
			money -= 1
			ds_list_add(myPurchased,pokeType)
			ds_list_delete(shopContents,localIndex)
		}
	break;
	case 14: //player xp request
		if(money>=5 && level<10){
			money -=5	
			xp +=4
			handle_level()
		}
	break;
}