def stock_picker(stock_prices)
  startIndex = 1
  numDays = stock_prices.length
  lastIndex = numDays - 1

  maxProfit = 0;
  buyAndSellDay = [nil,nil]

  stock_prices.each_with_index do |price, day| 
    currIndex = startIndex
    while(currIndex <= lastIndex)
      buyValue = -(stock_prices[day])
      sellValue = stock_prices[currIndex]
      currProfit = buyValue + sellValue

      if(currProfit > maxProfit)
        maxProfit = currProfit
        buyAndSellDay[0] = day #set the buy date
        buyAndSellDay[1] = currIndex #set the sell date
      end 
      currIndex+=1;
    end
    startIndex += 1
  end
  
  if(maxProfit == 0)
    return "You cannot make a profit based on these stock prices"
  else
    return buyAndSellDay
  end
end

# Test Example 1: Generic case, highest profit does not involve first or last index
my_stock_prices = [17,3,6,9,15,8,6,1,10]
p "TEST 1: #{stock_picker(my_stock_prices)}"

# Test Example 2: When lowest day is the last day
my_stock_prices2 = [9,22,5,8,1]
p "TEST 2: #{stock_picker(my_stock_prices2)}"

# Test Example 3: The highest day is the first day
my_stock_prices3 = [22,9,2,5,8,2]
p "TEST 3: #{stock_picker(my_stock_prices3)}"

# Test Example 4: You cannot make a profit with the given prices
my_stock_prices4 = [1,1,1,1,1]
p "TEST 4: #{stock_picker(my_stock_prices4)}"


