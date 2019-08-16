game_time = 60*7//60*20
shop_time = 60*10//60*30
wait_time = 60*2//60*5
t = 0
round_num = 1
state = 0
exportT = 0
game_boards = ds_list_create()
for(var i = 0; i<floor((Obj_Server.maxClients)/2); i++){
	var newBoard = instance_create_depth(300+(i mod 4)*100,300 + floor(i/4)*100, 1, game_board)
	ds_list_add(game_boards,newBoard)
}
global.pieceId = 0

global.pokeLookup = ds_list_create()
ds_list_add(global.pokeLookup,"charmander")
ds_list_add(global.pokeLookup,"charmeleon")
ds_list_add(global.pokeLookup,"charizard")
ds_list_add(global.pokeLookup,"paras")
ds_list_add(global.pokeLookup,"parasect")
ds_list_add(global.pokeLookup,"pichu")
ds_list_add(global.pokeLookup,"pikachu")
ds_list_add(global.pokeLookup,"raichu")
ds_list_add(global.pokeLookup,"zubat")
ds_list_add(global.pokeLookup,"golbat")
ds_list_add(global.pokeLookup,"pidgey")
ds_list_add(global.pokeLookup,"pidgeotto")
ds_list_add(global.pokeLookup,"pidgeot")
ds_list_add(global.pokeLookup,"weedle")
ds_list_add(global.pokeLookup,"kakuna")
ds_list_add(global.pokeLookup,"beedrill")