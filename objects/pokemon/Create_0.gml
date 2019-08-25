color = false
board = noone
opponent = noone
owner = noone
pieceId = 0
facing = 1
target = noone
for(var i = 0; i<8; i++){
	for(var j = 0; j<8; j++){
		stateArray[i, j] = 0 
		gArray[i, j] = 0 
		hArray[i, j] = 0 
	}
}
range = 14
claimX = x
claimY = y