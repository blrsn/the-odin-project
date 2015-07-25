require 'socket'

server = TCPServer.open(2002) #listening on port 2000 of localhost 127.0.0.1

loop {  #listening continously 
  Thread.start(server.accept) do |client|
    # waiting to connect
    client.puts(Time.now.ctime)
    client.puts "Closing the connection. Bye!"
    client.close
  end
}