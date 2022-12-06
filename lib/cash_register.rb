require 'pry'

class CashRegister

    attr_accessor :discount
    attr_accessor :total
    attr_accessor :items
    attr_accessor :last_price

    def initialize(discount = 0)
        @discount = discount.to_f
        @total = 0
        @items = []
        @last_price = []
    end

    def add_item title, price, quantity=1
        self.total += price * quantity
        quantity.times do
            items.push(title)
        end
        last_price.push(price * quantity)
    end

    def apply_discount
        @total = total - ((discount/100) * total)
       discount > 0 ?  "After the discount, the total comes to $#{total.to_i}." : "There is no discount to apply."
    end

    def void_last_transaction
        @total = total - last_price.last
        last_price.pop
    end
end
