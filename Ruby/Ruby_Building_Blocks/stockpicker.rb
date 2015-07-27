def stock_picker arr

  sell_array = []
  possible_max_profits = []
  
  (arr.length-1).times do |i| #outer loop imitating buying of a stock 
    
    sell = []
    prof_particular_day = [] # array of profit for stocks bought on a particular day
    
    for j in ((i+1)...arr.length) # inner loop imititating selling of a stock so starts at i+1 where i - day stock was bought
      
      profit  =arr[i] - arr[j]  #computing all possible profit for stocks bought on i
      prof_particular_day << profit #storing all possible profits for stocks bought on i index
    
    end
    
    max_profit = prof_particular_day.min # maximum profit possible for stock bought on i 
    
    sell_array << prof_particular_day.index(max_profit) #buy index is preserved in possible_max_profits array
    #to find sell index the difference is stored in sell_array
    
    possible_max_profits << max_profit # storing all max profits possible
    
    
  end
  
  final_prof = possible_max_profits.min
  # puts final_prof
  buy = possible_max_profits.index(final_prof)  #obtaining buy index preserved in possible_max_profits
  
  puts "buy on #{buy}"
  puts "sell on #{buy+sell_array[buy]+1}" #printing sell index by adding buy index with difference stored in sell index
  puts "profit $#{final_prof.magnitude}"

end


stock_picker [17,3,6,9,15,8,6,1,10]

stock_picker [4,3,2,1,20,8,6,23,10]