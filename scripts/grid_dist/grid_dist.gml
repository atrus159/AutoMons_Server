var x1 = argument0
var y1 = argument1
var x2 = argument2
var y2 = argument3

var dist = 0
while(true){
	var ySign = sign(y2-y1)
	var xSign = sign(x2-x1)
	if(x1 != x2){
		if(y1 != y2){
			x1+= xSign
			y1+= ySign
			dist+=14
		}else{
			x1+= xSign
			dist+=10
		}
	}else{
		if(y1 != y2){
			y1+= ySign
			dist+=10
		}else{
			return dist	
		}
	}
}