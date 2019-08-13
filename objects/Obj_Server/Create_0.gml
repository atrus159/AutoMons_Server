port = 8000
maxClients = 8
server = network_create_server(network_socket_tcp,port,maxClients)
players = ds_list_create()
playerCount = 0
playerIdCount = 0
count_down_timer = 60