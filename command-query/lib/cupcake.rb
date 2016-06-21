class Cupcake < Struct.new(:kind, :sugar)
  def flavor
    self.kind
  end
end
