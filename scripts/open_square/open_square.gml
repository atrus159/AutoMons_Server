var gx = argument0
var gy = argument1
var targX = argument2
var targY = argument3
stateArray[gx,gy] = 1
for(var i = -1; i<=1; i++){
	for(var j = -1; j<=1; j++){
		if(gx+i>= 0 && gx+i<8 && gy+j>=0 && gy+j<8){
			var dist = 10
			if(i != 0 && j != 0){
				dist = 14	
			}
			if(stateArray[gx+i,gy+j] == 0){
				stateArray[gx+i,gy+j] = 2
				gArray[gx+i,gy+j]= gArray[gx,gy] + dist
				hArray[gx+i,gy+j] = grid_dist(gx+i,gy+j,targX,targY)
			}else if(stateArray[gx+i,gy+j] != 3){
				if(gArray[gx,gy] + dist < gArray[gx+i,gy+j]){
					gArray[gx+i,gy+j] = gArray[gx,gy] + dist	
				}
			}
		}
	}
}