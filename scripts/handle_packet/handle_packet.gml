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
			var relX = 40*pX+board.x
			var relY = 40*pY+board.y+160
			if(color){
				relX = 40*(7-pX)+board.x
				relY = 40*(3-pY)+board.y
			}
			var piece = instance_create_depth(relX,relY,0,pokeType)
			piece.color = color
			piece.opponent = opponent
			piece.board = board
			piece.owner = id
			piece.pieceId = global.pieceId
			global.pieceId++
			if(sendTo != noone){
				relX = 40*(7-pX)+sendTo.board.x
				relY = 40*(3-pY)+sendTo.board.y
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
		var compArray = ds_map_find_value(global.componentLookup,pokeType)
		var canBuy = (money>=compArray[2])
		if(localIndex != -1 && canBuy){
			money -= compArray[2]
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
	case 15: //player sell request
		var pokeId = buffer_read(buffer,buffer_u8)
		var pokeName = ds_list_find_value(global.pokeLookup,pokeId)
		var compArray = ds_map_find_value(global.componentLookup,pokeName)
		var count = 0
		for(var i = 0; i<compArray[1];i++){
			var index = ds_list_find_index(myPurchased,compArray[0])
			if(index != -1){
				ds_list_delete(myPurchased,index)
				count ++
			}
		}
		if(count == compArray[1]){
			money += count*compArray[2]
			for(var i = 0; i<count; i++){
				ds_list_add(global.draftBucket[compArray[2]-1],compArray[0])	
			}
		}else{
			for(var i = 0; i<count; i++){
				ds_list_add(myPurchased,compArray[0])	
			}
		}

	
	break;
}