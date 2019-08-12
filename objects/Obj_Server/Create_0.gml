port = 8000
maxClients = 8
server = network_create_server(network_socket_tcp,port,maxClients)
players = ds_list_create()
global.playerCount = 0