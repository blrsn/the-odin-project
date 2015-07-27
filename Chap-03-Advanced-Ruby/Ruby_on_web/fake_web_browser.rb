require 'socket'
require 'json'

hostname = 'localhost'
port = 2000
path = '/index.html'
total_response = ""
user = {user: {name: "Berin",age: "21"}}

 request = "GET #{path} HTTP/1.1\r\n\r\n" #Typical HTTP request
 # request = "GET /invalid HTTP/1.1\r\n\r\n" #request with invalid path

 # puts user.to_json
 # request = "POST /thanks.html HTTP/1.1\r\nContent-length: #{user.to_json.size}\r\n\r\n#{user.to_json}"

socket = TCPSocket.open(hostname,port) # connecting to server
socket.print(request)

headers = ""
while line = socket.gets # request message is stored in request_message
  
    headers<< line
    break if headers =~ /\r\n\r\n$/
end

puts headers
# parsing response
hlines = headers.split('\r\n')
first_line = hlines[0].split(' ')
protocol = first_line[0]
status_code = first_line[1]
status = first_line[2]

# body = client.read(headers[2].to_i)
    
# end
puts body
socket.close
