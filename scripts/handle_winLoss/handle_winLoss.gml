switch(won){
	case  1:
		if(winStreak<maxWin){
		winStreak +=1
		}
		loseStreak =0
		money +=1
	break;
	case 0:
		if(loseStreak<maxLose){
		loseStreak +=1
		}
		winStreak =0
	break;
}
won = -1