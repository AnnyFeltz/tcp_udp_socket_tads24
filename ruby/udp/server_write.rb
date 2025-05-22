    #fiz o read primeiro, checa ele lá

    require 'socket' #importa o socket
    require 'date' #importa o date pq no ruby não tem date time

    # Função principal do servidor
    def start_server(host, port)
        server_read = UDPSocket.new # cria um servidor UDP
        
        server_read.bind(host, port)  # conecta na porta/IP pra escutar
        puts "Server [MONITOR] started at #{host}:#{port}\nListening now..."

        loop do # loop infinito, igual em python
            #listening for incoming data
            data, addr = server_read.recvfrom(1024)  # recebe dados do cliente
            message = data.force_encoding("UTF-8").split(',') # força a codificação dos dados recebidos e separa por vírgula
        
            time = Time.now.strftime("%H:%M:%S") # é bem mais curto e intuitivo em ruby kk
            puts "#{time} - [#{message[0]}]: #{message[1]}" # printa os dados recebidos do cliente
        end 
    end 
    # Configurações e chamada da função principal
    if __FILE__ == $0
        host = 'localhost'   # onde vai escutar
        port = 9000          # porta de entrada

        start_server(host, port)  # inicia o servidor
    end