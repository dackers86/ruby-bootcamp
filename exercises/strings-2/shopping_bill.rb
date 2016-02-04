  class ShoppingBill
    def initialize(shopping_list)
      price_list = "orange = 10p apple = 20p bread = £1.10 tomato = 25p cereal = £2.34"
      @price_collection = price_list.scan /\S+\ \=\ \S+/
      @shopping_list = shopping_list
    end

    def total
     @total_price ||= generate(@shopping_list)
    end

    def message
      "The price of the shopping list is: #{sprintf('£%.2f', total/100.00)}"
    end

    def generate(shopping_list)
        prices = @price_collection.inject(Hash.new) { | price_hash, item |
          values = extract_shopping_item(item)
          price_hash[values[:keyname]] = values[:price]
          price_hash
        }

        clean_list = shopping_list.lines.collect { | line | line.strip }

        clean_list.inject(0) do | running_total, item |
          running_total + prices.fetch(item.to_sym, 0)
        end 
    end

    def extract_shopping_item(item)
      values = item.match /(.*) = (.*)/
      {keyname: values[1].to_sym, price: extract_digits(values[2])}
    end

    def extract_digits(price)
      price.gsub(/[^0-9]/, "").to_i
    end

  end
