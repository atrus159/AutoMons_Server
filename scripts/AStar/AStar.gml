var startX = argument0
var startY = argument1
var curX = argument2
var curY = argument3
var targX = argument4
var targY = argument5
if(grid_dist(curX,curY,targX,targY) <= range){
	while(true){
		var curBest = 999
		var bestX = -1
		var bestY = -1
		for(var i = -1; i<=1; i++){
			for(var j = -1; j<=1; j++){
				if(curX+i >= 0 && curX+i<8 && curY+j >=0 && curY+j<8){
					if(curX+i == startX && curY+j == startY){
						return [curX,curY]	
					}
					if(stateArray[curX+i,curY+j] == 1 || stateArray[curX+i,curY+j] == 2){
						if(gArray[curX+i,curY+j] < curBest){
							curBest = gArray[curX+i,curY+j]
							bestX = curX+i
							bestY = curY+j 
						}
					}
				}
			}
		}
		curX = bestX
		curY = bestY
	}
}else{
	open_square(curX,curY,targX,targY)
	var lowest = 999
	var recordX = -1
	var recordY = -1
	for(var i = 0; i < 8; i++){
		for(var j = 0; j<8; j++){
			if(stateArray[i,j] == 2){
			var fCost = gArray[i,j]+hArray[i,j]
				if(fCost<lowest){
					lowest = fCost
					recordX = i
					recordY = j
				}
			}
		}
	}
	return AStar(startX,startY,recordX,recordY,targX,targY)
}