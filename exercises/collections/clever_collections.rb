require 'money'

prices = {
  'orange' => 99,
  'apple' => 20,
  'bread' => 100,
  'tomato' => 25,
  'cereal' => 236
}

shopping_list = [ :orange, :apple, :apple, :cereal, :bread ]

total_pence = 0

shopping_list.each do |item|
  total_pence += prices.fetch(item.to_s)
end

puts "The price of the shopping list is: #{sprintf('£%.2f', total_pence/100.00)}"