import socket
import datetime

# Função principal do servidor
def start_server(host: str, port: int):
    server_read = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)  # socket UDP pra receber
    
    server_read.bind((host, port))  # conecta na porta/IP pra escutar
    print(f"Server [MONITOR] started at {host}:{port}\nListening now...")


    while True:
        #listening for incoming data
        data, addr = server_read.recvfrom(1024)  # recebe dados do cliente
        message = data.decode('utf-8').split(',')  # transforma de bytes pra string
        
        time = datetime.datetime.now().strftime("%H:%M:%S")
        print(f"[{time}] [{message[0].upper()}], {message[1]}")  # imprime os dados recebidos

# Configurações e chamada da função principal
if __name__ == '__main__':
    HOST = 'localhost'   # onde vai escutar
    PORT = 9000          # porta de entrada

    start_server(HOST, PORT)  # inicia o servidor
