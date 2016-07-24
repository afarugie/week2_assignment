require 'minitest/autorun'
require 'cart'
require 'item'

class TestCart < MiniTest::Test
  def setup
    @cart = Cart.new
    @pizza = Item.new("pizza", 15.55)
    @cart.add_item(@pizza)
    @items = @cart.items
  end

  def test_add_item_method_adds_item
    assert_equal "pizza", @items.keys.first.name
  end

  def test_items_returns_item_object
    assert_equal Item, @items.keys.first.class
  end

  def test_items_returns_number_of_items
    @cart.add_item(@pizza)
    assert_equal 2, @items.values.first
  end

  def test_items_can_hold_multiple_items
    @salad = Item.new("salad", 9.99)
    @soda = Item.new("soda", 2.00)
    @cart.add_item(@salad)
    @cart.add_item(@soda)
    assert_equal 3, @items.count
  end

  def test_only_items_can_be_added_to_cart
    assert_raises Exception do
      @cart.add_item("soda")
    end 
  end

  def test_total_method_returns_total_price
    @salad = Item.new("salad", 9.99)
    @cart.add_item(@salad)
    @cart.add_item(@salad)
    assert_equal 35.53, @cart.total
  end
end
