module Money
  def to_dollars
    (self.to_i / 100.0).to_f 
  end
end
