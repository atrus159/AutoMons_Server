t++;
switch(state){
	case 0:
	exportT = round((shop_time-t)/60)
	if(t>=shop_time){
		start_wait_phase()
		t = 0
		state = 1
	}
	break;
	case 1:
	exportT = round((wait_time-t)/60)
	if(t>=wait_time){
		start_battle_phase()
		t = 0
		state = 2
	}
	break;
	case 2:
	exportT = round((game_time-t)/60)
	var roundDecided = 1
	with(game_board){
		if(bluePlayer != noone && !decided){
			roundDecided = 0	
		}
	}
	if(roundDecided){
		t = game_time	
	}
	if(t>=game_time){
		t = 0
		state = 0
		round_num ++
		start_shop_phase()
	}
	break;
	
}