require_relative 'item'
require_relative 'cart'

class Menu
  attr_accessor :cart, :items

  def initialize 
    @cart = Cart.new
    arduino_lawn_mower = Item.new("Arduino Lawn Mower", 159.37)
    electric_guitar = Item.new("Electric Guitar", 2500.79)
    lasagna = Item.new("Lasagna", 47.99)
    red_stapler = Item.new("Red Stapler", 25.99)
    window_shutters = Item.new("Window Shutters", 85.00)
    @items = [lasagna, red_stapler, electric_guitar, arduino_lawn_mower,
              window_shutters]
  end

  def add_to_cart(choice)
    @cart.add_item(@items[choice])
    self.keep_shopping?
  end

  def banner
    output = "Enter the number next to the product you would like to purchase.\n"
    @items.each_with_index do |value, index|
      output << "#{index}- #{value.name} -$#{(value.price / 100.0).to_f}\n"
    end
    puts output
  end

  def checkout
    output = "Total Items:\n"
    @cart.items.each do |key, value|
      output << "#{key.name}: $#{(key.price / 100.0).to_f} x #{value} = $#{((key.price * value) / 100.0).to_f}\n"
    end
    puts output, "Total: $#{@cart.total}"
  end

  def get_user_input
    gets.chomp
  end

  def keep_shopping?
    puts "would you like to continue shopping? y/n: "
    self.shop self.get_user_input
  end

  def shop(choice)
    if self.cart.items.count == 0
      self.add_to_cart choice.to_i
    elsif choice == 'n'
      self.checkout
    elsif choice.to_i.is_a? Numeric
      self.banner
      self.add_to_cart self.get_user_input.to_i
    end
  end

  def welcome
    puts "Welcome to CL-Shop."
  end
end

menu = Menu.new
puts menu.welcome, menu.banner
menu.shop menu.get_user_input
