# #for loop
# loopResult = 0
# for i in ([1, 2, 3, 4, 5])
#    loopResult += i
# end
# puts "#{loopResult}"
# puts "\n"

# #while loop
# array = [1, 2, 3, 4, 5]
# count = 0
# result  = 0
# while (count < array.count) do
#   result += array[count]
#     count += 1

#     puts result
# end
# puts result
# puts "\n"

# #recursion loop
# def countdown(n)
#   return if n.zero?
#   puts n
#   countdown(n-1)
# end

# # countdown(10)
# # puts "\n"

# def combineList(l1, l2)
#   maxCount = [l1.count, l2.count].max
#   result  = []

#   for i in 0..maxCount
#     result << l1[i] unless l1[i].nil?
#     result << l2[i] unless l2[i].nil?
#   end

#   return result
# end

# list_one = ["a", "b", "c","d"]
# list_two = [1, 2, 3]

# p combineList(list_one, list_two)
# puts "\n"

def CalculateFibonnaci(required_results)

  return [] unless required_results > 0

  result = [0, 1]

  (required_results - 2).times do |iterator|
    result << result[iterator] + result[iterator+1]
  end 

  result.first(required_results)

end

puts CalculateFibonnaci(1)

