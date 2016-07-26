require_relative 'money'
include Money

class Item
  attr_accessor :price, :name

  def initialize(name, price)
    @name = name
    @price = price.to_cents
  end
end
