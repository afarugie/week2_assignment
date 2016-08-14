require_relative 'money'
include Money

class Cart
  def initialize
    @items = Hash.new(0)
  end

  def add_item(item)
    raise Exception, "#{item} is not a valid item" unless item.is_a? Item
    @items[item] += 1
  end

  def total
    # see Enum.reduce for hashes.  
    #   acc is the accumulator, then a tuple of the key and val
    #   Each iterationm current element is key and value
    #   so we can total up.
    #   If you have a data structure you need to roll up to a single value, reach for reduce.
    @items.reduce(0){|acc, (key, val)| acc + (key.price * val)}
         .to_dollars
  end

  def items
    @items
  end
end
