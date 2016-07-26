require_relative 'money'
include Money

class Cart
  def initialize
    @items = Hash.new(0)
  end

  def add_item(item)
    unless item.is_a? Item
      raise Exception, "#{item} is not a valid Item"
    else
      @items[item] += 1
    end
  end

  def total
    total = BigDecimal.new(0)
    items.each do |key, value|
      cost = key.price * value
      total += cost
    end
    total.to_dollars
  end

  def items
    @items
  end
end
