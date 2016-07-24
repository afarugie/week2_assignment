require 'minitest/autorun'
require 'item'

class TestItem < MiniTest::Test
  def setup
    @item = Item.new("pizza",15.55)
  end

  def test_has_a_price
    assert_equal 15.55, (@item.price / 100.0).to_f
  end

  def test_item_has_name
    assert_equal 'pizza', @item.name
  end
end
