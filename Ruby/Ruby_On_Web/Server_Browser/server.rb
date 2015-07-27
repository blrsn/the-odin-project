require 'socket'
require 'json'

server = TCPServer.open(2000) #listening on port 2000 of localhost 127.0.0.1

loop {  #listening continously 
    client = server.accept # waiting for connection and when connected returns 
     
    header = ""
    while line = client.gets # request message is stored in request_message
      
        header << line
        break if header =~ /\r\n\r\n$/
    end

    puts "received request #{header}"
     # HTTP Parser
     
    # header,body = request.split('\r\n\r\n',2)
    
    request_arr = header.split(' ')
    method = request_arr[0]     # 'GET' or 'POST'
    path = request_arr[1]       # 'Path to retrieve' 
    protocol = request_arr[2]   # HTTP/1.1
    path = path[1..-1]
    # puts body

    if File.exists? path 
      
      if method == 'GET'
        puts "handling get"      
        file = File.open("#{path}")
        puts "opened file #{path}"
        puts file.read
        response = "#{protocol} 200 OK\r\n#{Time.now.ctime}\r\nContent-Length: #{file.size}\r\n\r\n#{file.read}\r\n\r\n" 
        client.puts response

      elsif method == 'POST'
        
        body = client.gets
        file = File.open("#{path}")
        params = JSON.parse(body)
        new_file = file.gsub("<%= yield %>","<ul><li>#{params[user][name]}</li><li>#{params[user][age]}</li></ul> ")
        response = "#{protocol} 200 OK\r\n#{Time.now.ctime}\r\nContent-Length: #{file.size}\r\n\r\n#{file.read}" 
        client.puts response
        params
        
      else
        
        client.puts "hello fellow"
        
      end
      
      
    
    else
      
      file = File.open("notfound.html")
      response = "#{protocol} 404 NotFound\r\n\r\n"
      client.puts response
      client.puts file.read 
    
    
  end
  
  client.close
}