require_relative 'shopping_bill'

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


shopping_bill = ShoppingBill.new(shopping_list)

p shopping_bill.message








