require 'bigdecimal'

module Money
  def to_cents
    BigDecimal.new((self * 100).to_i)
  end

  def to_dollars
    (self.to_i / 100.0).to_f 
  end
end
