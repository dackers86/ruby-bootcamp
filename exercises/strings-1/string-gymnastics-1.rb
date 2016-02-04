prices = {
  'orange' => 10,
  'apple' => 20,
  'bread' => 100,
  'tomato' => 25,
  'cereal' => 234
}

shopping_list = <<-LIST
 list
 orange
 apple
 apple
 orange
 tomato
 cereal
 bread
 orange
 tomato
LIST

total_pence = 0


clean_list = shopping_list.lines.collect { |line| line.strip }

total_pence = clean_list.inject(0) do |running_total, item|
  running_total + prices.fetch(item, 0)
end


# shopping_list.each do |item|
#    total_pence += prices.fetch(item.strip)
# end



# shopping_list.split("\n").each do |item|
#    total_pence += prices.fetch(item.strip)
# end

puts "The price of the shopping list is: #{sprintf('£%.2f', total_pence/100.00)}"