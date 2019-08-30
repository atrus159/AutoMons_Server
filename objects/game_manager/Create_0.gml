game_time = 60*20
shop_time = 60*30
wait_time = 60*5
t = 0
round_num = 1
state = 0
exportT = 0
game_boards = ds_list_create()
for(var i = 0; i<floor((Obj_Server.maxClients)/2); i++){
	var newBoard = instance_create_depth(200+(i mod 4)*400,200 + floor(i/4)*400, 1, game_board)
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
ds_list_add(global.pokeLookup,"bellsprout")
ds_list_add(global.pokeLookup,"weepinbell")
ds_list_add(global.pokeLookup,"victreebel")
ds_list_add(global.pokeLookup,"swinub")
ds_list_add(global.pokeLookup,"piloswine")

global.componentLookup = ds_map_create()
ds_map_add(global.componentLookup,"charmander",["charmander",1,5])
ds_map_add(global.componentLookup,"charmeleon",["charmander",3,5])
ds_map_add(global.componentLookup,"charizard",["charmander",9,5])
ds_map_add(global.componentLookup,"paras",["paras",1,3])
ds_map_add(global.componentLookup,"parasect",["paras",3,3])
ds_map_add(global.componentLookup,"pichu",["pichu",1,4])
ds_map_add(global.componentLookup,"pikachu",["pichu",3,4])
ds_map_add(global.componentLookup,"raichu",["pichu",9,4])
ds_map_add(global.componentLookup,"zubat",["zubat",1,2])
ds_map_add(global.componentLookup,"golbat",["zubat",3,2])
ds_map_add(global.componentLookup,"pidgey",["pidgey",1,1])
ds_map_add(global.componentLookup,"pidgeotto",["pidgey",3,1])
ds_map_add(global.componentLookup,"pidgeot",["pidgey",9,1])
ds_map_add(global.componentLookup,"weedle",["weedle",1,1])
ds_map_add(global.componentLookup,"kakuna",["weedle",3,1])
ds_map_add(global.componentLookup,"beedrill",["weedle",9,1])
ds_map_add(global.componentLookup,"bellsprout",["bellsprout",1,1])
ds_map_add(global.componentLookup,"weepinbell",["bellsprout",3,1])
ds_map_add(global.componentLookup,"victreebel",["bellsprout",9,1])
ds_map_add(global.componentLookup,"swinub",["swinub",1,1])
ds_map_add(global.componentLookup,"piloswine",["swinub",3,1])

global.draftBucket = array_create(5)
global.draftBucket[0] = ds_list_create()
global.draftBucket[1] = ds_list_create()
global.draftBucket[2] = ds_list_create()
global.draftBucket[3] = ds_list_create()
global.draftBucket[4] = ds_list_create()
var tNum = [45,30,25,15,10]
for(var i = 0; i<ds_list_size(global.pokeLookup); i++){
	var pokeId = ds_list_find_value(global.pokeLookup,i)
	var compArray = ds_map_find_value(global.componentLookup,pokeId)
	if(compArray[1] == 1){
		for(var j = 0; j<tNum[compArray[2]-1]*10; j++){
			ds_list_add(global.draftBucket[compArray[2]-1],compArray[0])	
		}
	}
}