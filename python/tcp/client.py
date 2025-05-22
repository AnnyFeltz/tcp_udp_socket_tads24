import socket

def send_message_to_server(addr: str, port: int):
    server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server.connect((addr, port))

    while True:
        message = input('Digite a mensagem: ')
        server.sendto(message.encode(),(addr,port))

        print(f'[SERVIDOR]: {server.recv(1024).decode()}')


if __name__=='__main__':
    HOST='localhost'
    PORT=8000

    send_message_to_server(HOST, PORT)