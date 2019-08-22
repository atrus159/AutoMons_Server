with(player){
	handle_winLoss()
	board = noone
	opponent = noone
	sendTo = noone
	reciveFrom = noone
	xp+=1
	handle_level()
	get_shop_contents(shopContents,level)
	var intrest = 0
	if(money>=10){
		intrest ++	
	}
	if(money>=20){
		intrest ++	
	}
	if(money>=30){
		intrest ++	
	}
	if(money>=40){
		intrest ++	
	}
	if(money>=50){
		intrest ++	
	}
	var baseGold = level
	if(baseGold>5){
		baseGold = 5	
	}
	var winS = 0
	if(winStreak>1){
		winS = winStreak-1
	}
	var loseS = 0
	if(loseStreak>1){
		loseS = loseStreak-1
	}
	money+=baseGold+intrest+winS+loseS
}
with(pokemon){
	instance_destroy(self)	
}
with(game_board){
	redPlayer = noone
	bluePlayer = noone
	decided = 0
}
global.pieceId = 0
