playerCount = ds_list_size(players)
if(playerCount == 8 && !instance_exists(game_manager)){
	count_down_timer -= 1
	if(count_down_timer <=0){
	send_start_signal()	
	}
}