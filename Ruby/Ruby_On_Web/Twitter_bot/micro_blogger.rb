require 'jumpstart_auth'

class Microblogger
  attr_accessor :client
  
  # initialize and connect to twitter using OAuth
  def initialize
    puts "initializing microblogger"
    @client = JumpstartAuth.twitter
  end
  
  # followers list
  def followers_list
    screen_names = []
    @client.followers.each {|follower| screen_names << follower}
    screen_names
  end
  
  # friends list
  def friends_list
    friends = []
    @client.friends.each { |friend| friends << @client.user(friend) }
		friends = friends.sort_by { |f| f.screen_name.downcase }
    friends
  end
  
  # tweet message
  def tweet(message)
    puts "posting tweet"
    @client.update(message)
  end
  
  # direct message
  def dm(target,message)
    message ="d @#{target} #{message}"
    puts message
    tweet(message)
  end
  
  # Spam all followers
  def spam(message)
    screen_name = followers_list
    screen_name.each { |follower| dm(follower,message) }
  end
  
  def everyones_last_tweet
    friendsl = friends_list
		friendsl.each do |friend|
		timestamp = friendsl.status.created_at
		puts "#{friendsl.screen_name} said at #{timestamp.strftime("%A, %b %d %Y")}..."
		puts friendsl.status.text
		puts ""
		end
  end
  
  def run
    puts "Welcome to twitter command line interface"
    loop do
      printf "\n\nEnter command: "
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
        screen_names = followers_list
        
        if screen_names.none? {|follower| follower == target }
          puts "@#{target} is not your follower. Unable to send dm"
          next
        end
        mess = command[2..-1].join(' ')
        dm(target,mess)
        
      when 'f_list'
        
        screen_name = followers_list 
        puts screen_name
        
      when 'spam'
        
        mess = command[1..-1].join(" ")
        spam mess
        
      when 'elt'
        
        everyones_last_tweet
        
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