if(game_manager.state == 2){
	if(target == noone || !instance_exists(target)){
	var nearestDist = room_width
	with(pokemon){
		if(opponent == other.owner){
			if(distance_to_object(other)<nearestDist){
				other.target = id
				nearestDist = distance_to_object(other)
			}
		}
	}
	}
	if(target != noone){
	if(point_distance(x,y,claimX,claimY)>=5){
		move_towards_point(claimX,claimY,1)
		set_facing()
	}else{
	move_snap(40,40)
	var gridX = floor((x-board.x+20)/40)
	var gridY = floor((y-board.y+20)/40)
	var targX = floor((target.x-board.x+20)/40)
	var targY = floor((target.y-board.y+20)/40)
	if(grid_dist(gridX,gridY,targX,targY)<=14){
		speed = 0	
		direction = 180-darctan2(y-target.y,x-target.x)
		set_facing()
	}else{
		for(var i = 0; i<8; i++){
			for(var j = 0; j<8; j++){
				stateArray[i, j] = 0 
				gArray[i, j] = 0 
				hArray[i, j] = 0 
			}
		}
		with(pokemon){
			if(id != other.id && id != other.target){
				var myX = floor((claimX-board.x+20)/40)
				var myY = floor((claimY-board.y+20)/40)
				other.stateArray[myX, myY] = 3
			}
		}
		hArray[gridX,gridY] = grid_dist(gridX,gridY,targX,targY)
		var dest = AStar(gridX,gridY,gridX,gridY,targX,targY)
		claimX = dest[0]*40+board.x
		claimY = dest[1]*40+board.y
	}
	}
}
}