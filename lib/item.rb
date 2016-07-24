class Item
  require 'bigdecimal'

  attr_accessor :price, :name

  def initialize(name, price)
    @name = name
    @price = BigDecimal.new((price * 100).to_i)
  end
end
