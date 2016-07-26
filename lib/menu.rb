require_relative 'item'
require_relative 'cart'
require_relative 'money'
include Money

class Menu
  attr_reader :cart, :items

  def initialize 
    @cart = Cart.new
    @items = [Item.new("Arduino Lawn Mower", 159.37),
              Item.new("Electric Guitar", 2500.79),
              Item.new("Lasagna", 47.99),
              Item.new("Red Stapler", 25.99),
              Item.new("Window Shutters", 85.00)]
  end

  def add_to_cart(choice)
    @cart.add_item(@items[choice])
    keep_shopping?
  end

  def banner
    output = "Enter the number next to the product you would like to purchase.\n"
    @items.each_with_index do |value, index|
      item_price = value.price.to_dollars
      output << "#{index}- #{value.name} - $#{item_price}\n"
    end
    puts output
  end

  def checkout
    output = "Total Items:\n"
    @cart.items.each do |key, value|
      item_name = key.name
      item_price = key.price.to_dollars
      item_total = (key.price * value).to_dollars
      output << "#{item_name}: $#{item_price} x #{value} = $#{item_total}\n"
    end
    puts output, "Total: $#{@cart.total}"
  end

  def get_user_input
    gets.chomp
  end

  def keep_shopping?
    puts "would you like to continue shopping? y/n: "
    shop get_user_input
  end

  def shop(choice)
    if cart.items.count == 0
      add_to_cart choice.to_i
    elsif choice == 'n'
      checkout
    elsif choice.to_i.is_a? Numeric
      banner
      add_to_cart get_user_input.to_i
    end
  end

  def welcome
    puts "Welcome to CL-Shop."
  end
end

menu = Menu.new
puts menu.welcome, menu.banner
menu.shop menu.get_user_input
