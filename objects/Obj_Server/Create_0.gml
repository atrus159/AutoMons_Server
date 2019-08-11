port = 8000
maxClients = 8
server = network_create_server(network_socket_tcp,port,maxClients)
sockets = ds_list_create()
send_buffer = buffer_create(1024,buffer_fixed,1)