class CashRegister
  attr_accessor :total
  attr_reader :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = price * quantity
    self.total += price * quantity
    quantity.times { |i| @items << title }
  end

  def apply_discount
    if self.discount == 0
      return "There is no discount to apply."
    else
      self.total = self.total - (self.total*@discount)/100
      return "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
      self.total -= @last_transaction
  end
end