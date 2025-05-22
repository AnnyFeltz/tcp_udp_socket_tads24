#fiz o read primeiro cehca lá
require 'socket' #importa o socket

# Função principal do servidor
def send_message(host, port)
    server = UDPSocket.new # cria um servidor UDP
    # isso aqui = server.settimeout(1) ; não tem no ruby >:( 
    # eles deveriam ter isso já, muito chato procurar como fazer isso
    
    timeout = 1 # tempo de timeout

    ready = IO.select([server], [], [], timeout) # espera por dados
    if ready
        data, addr = server.recvfrom(1024) # recebe dados do cliente
        puts "#{data}" # printa os dados recebidos do cliente

    eles
        puts "Timeout: não recebi nadaaaaaaaa no #{timeout}" # printa se não recebeu nada
    end

    print 'type your name: ' #pq print e não puts? pq puts pula linha e print não, e como eu quero q ele repsonda logo do ladinho do texto esse é melhor 😎 ps: acabei de descpbri q windows+. tem emoji e da pra colocar no vs 🤩
    name = gets.chomp.gsub(',','').strip # pega o nome do cliente e tira os espaços em branco e vírgulas esse aqui é pura pesquisa e sofirmento 😭
    
    loop do
        print 'type your message: '
        message = gets.chomp.gsub(',','').strip # agr é só eu gravar isso e fazer em todos hahahaha
    
        full_message = "#{name}, #{message}" # monta a mensagem completa com o nome e a mensagem
        server.send(full_message, 0, host, port) # envia a mensagem pro servidor
    end
end

if __FILE__== $0

    host = 'localhost'
    port = 8000

    send_message( host, port)
end