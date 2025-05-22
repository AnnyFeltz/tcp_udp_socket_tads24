import socket

def send_message(host: str, port: int):
    server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    server.settimeout(1)

    # send message
    name = input('type your name: ')
    
    name = name.replace(',','').strip()
    
    while True:
        message = input('type your message:')
        message = message.replace(',','').strip()
        
        message = f'{name}, {message}'
        server.sendto(message.encode(),(HOST, PORT))

if __name__=='__main__':

    HOST = 'localhost'
    PORT = 8000


    send_message( HOST, PORT)
