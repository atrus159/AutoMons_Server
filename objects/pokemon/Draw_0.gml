if(color){	
	draw_sprite(red_team_sprite,-1,x,y)
}else{
	draw_sprite(blue_team_sprite,-1,x,y)
}
draw_set_color(c_black)
draw_set_font(font0)
draw_text(x,y,pieceId)