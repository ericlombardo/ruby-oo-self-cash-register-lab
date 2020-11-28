# 10:36 start   &&   11:16 end
require 'pry'

class CashRegister
  
  attr_accessor :total, :discount, :item_list, :item_cost

  # sets total at 0, takes in discount amount, creates empty list and cost
  def initialize(discount = 0)         
    @item_list = []
    @item_cost = []
    @total = 0
    @discount = discount
  end

  # shovels each item to item_list, cost to item_cost, adds price of item to total price
  def add_item(item, price, quantity = 1)
    quantity.times {@item_list << item}
    self.item_cost << price * quantity
    self.total += price * quantity
  end

  # applies discount and returns message with new total or message for no discount
  def apply_discount
    self.total = @total - (@discount.to_f / 100.0 * @total.to_f).to_i
    self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total}."
  end

  # displays all items that have been added
  def items
    self.item_list
  end

  # removes last item in array, sets total to the sum of the rest of items
  def void_last_transaction
    @item_cost.pop
    self.total = @item_cost.sum
  end
end

