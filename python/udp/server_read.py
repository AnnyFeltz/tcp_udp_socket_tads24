import socket

# Função principal do servidor
def start_server(host_read: str, port_read: int, host_write: str, port_write: int):
    server_read = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # socket UDP pra receber
    server_read.bind((host_read, port_read))  # conecta na porta/IP pra escutar

    print(f"Server [READ] started at {host_read}:{port_read}\nListening now...")

    server_write = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # socket UDP pra enviar

    while True:
        #listening for incoming data
        data, addr = server_read.recvfrom(1024)  # recebe dados do cliente
        message = data.decode('utf-8').split(',')  # transforma de bytes pra string
        
        #data_client is string
        data_client = f'{message[0]}, {message[1]}, {addr}'.strip().encode('utf-8')
        print(data_client)
        
        #send data to the server_read
        server_write.sendto(data_client, (host_write, port_write))


# Configurações e chamada da função principal
if __name__ == '__main__':
    HOST_READ = 'localhost'   # onde vai escutar
    PORT_READ = 8000          # porta de entrada

    HOST_WRITE = 'localhost'  # pra onde vai mandar os dados
    PORT_WRITE = 9000         # porta de saída

    start_server(HOST_READ, PORT_READ, HOST_WRITE, PORT_WRITE)  # inicia o servidor
