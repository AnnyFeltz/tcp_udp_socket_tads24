#prof vou anotar do lado oq faz blz? vou usar ruby pq achei top quando o senhor pesquisou em aula kk

require 'socket' #importa o socket 

# Função pra iniciar o servidor, meio obvio pelo nome, e é bem parecido com python
def start_server(host_read, port_read, host_write, port_write)
    server_read = UDPSocket.new # cria um servidor UDP hahaha, to aprendendo slk
    server_read.bind(host_read, port_read)  # liga o servidor a porta e host

    puts "Server [READ] started at #{host_read}:#{port_read}\nListening now..." # kkkk 'puts', printa o host e porta do servidor

    server_write = UDPSocket.new # cria um servidor UDP pra escrever, o mesmo q ali em cima

    loop do #em ruby é loop do, em python é while True
        data, addr = server_read.recvfrom(1024) # recebe os dados do cliente,igual em python        
        message = data.force_encoding('UTF-8').split(',') # força a codificação dos dados recebidos e separa por vírgula, muda pouca coisa

        data_client = "#{message[0]}, #{message[1]}, #{addr}".strip.force_encoding('UTF-8') # re-encoda os dados recebidos e tira os espaços em branco
        puts "Mensagem do #{data_client}" # printa os dados recebidos do cliente

        server_write.send(data_client, 0, host_write, port_write) # envia os dados para o servidor de escrita
    end
end

if __FILE__ == $0 # ao inves de if name = main é file = $0 no ruby, o resto daqui pra baixo é igual só adicionei um end no final pq no ruby é assim q se fexham 'blocos'
    host_read = 'localhost'
    port_read = 8000

    host_write = 'localhost'
    port_write = 9000

    start_server(host_read, port_read, host_write, port_write)  
end
