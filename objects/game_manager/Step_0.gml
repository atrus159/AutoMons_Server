t++;
switch(state){
	case 0:
	if(t>=shop_time){
		start_wait_phase()
		t = 0
		state = 1
	}
	break;
	case 1:
	if(t>=wait_time){
		start_battle_phase()
		t = 0
		state = 2
	}
	break;
	case 2:
	if(t>=game_time){
		start_shop_phase()
		t = 0
		state = 0
		round_num ++
	}
	break;
	
}