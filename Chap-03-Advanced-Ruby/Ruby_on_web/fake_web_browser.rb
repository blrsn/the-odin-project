require 'socket'

hostname = 'www.berinlarson.com'
port = 80
path = '/'

request = "GET #{path} HTTP/1.1\r\nHost:#{hostname}\r\n\r\n"

socket = TCPSocket.open(hostname,port) # connecting to server
socket.print(request)
response = socket.read
headers,body = response.split("\r\n\r\n")
puts headers
