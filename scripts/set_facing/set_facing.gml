if(direction<=45 || direction >315){
	facing = 0	
}
if(direction>45 && direction <=135){
	facing = 1	
}
if(direction>135 && direction <=225){
	facing = 2	
}
if(direction>225 && direction <=315){
	facing = 3	
}
if(color){
	facing = (facing+2) mod 4
}