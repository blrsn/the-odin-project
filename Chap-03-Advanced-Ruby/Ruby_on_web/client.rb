require 'socket'


hostname = "localhost"
port = 2000

s = TCPSocket.open(hostname,port) # opens socket

while line = s.gets  # continue to run till s.gets a response from server
  puts line.chop
end

s.close