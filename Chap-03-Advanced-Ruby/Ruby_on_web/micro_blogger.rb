require 'jumpstart_auth'

class Microblogger
  attr_accessor :client
  
  def initialize
    puts "initializing microblogger"
    @client = JumpstartAuth.twitter
  end
  
  def tweet(message)
    puts "posting tweet"
    @client.update(message)
  end
  
  def dm(target,message)
    message ="d @#{target} #{message}"
    puts message
    tweet(message)
  end
  
  def run
    puts "Welcome to twitter command line interface"
    command = ''
    loop do
      printf "Enter command: "
      input = gets.chomp
      command = input.split(' ') 
      
      case command[0]
        
      when 't'
        
        puts "tweet command invoked"
        mess = command[1..-1].join(' ')
        tweet(mess)
        
      when 'q'
        
        puts "Quitting"
        break
        
      when 'dm'
        
        target = command[1]
        mess = command[2..-1].join('')
        dm(target,mess)
        
      when 'f'
        puts @client.friends
      
      else
        
        puts "I don't know how to process '#{command}'"
        
      end
    end
  end
        
end

if __FILE__ == $0
  
  blogger = Microblogger.new
  blogger.run
  # blogger.tweet("Just setting up my twitter account #droid_bot")
 #  blogger.tweet("-" * 140)
 #   blogger.tweet("."* 160)

  
end