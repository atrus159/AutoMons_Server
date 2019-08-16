with(player){
	board = noone
	opponent = noone
	sendTo = noone
	reciveFrom = noone
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
	money+=1+intrest
	xp+=1
	handle_level()
}
with(pokemon){
	instance_destroy(self)	
}
global.pieceId = 0
