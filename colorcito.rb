class Colorcito
  attr_accessor :red, :green, :blue

  def initialize(r, g, b)
    @red = r
    @green = g
    @blue = b
  end

  def add(x, y, z)
    Colorcito.new((@red + x), (@green + y), (@blue + z))
  end

  def minus(x, y, z)
    Colorcito.new((@red - x), (@green - y), (@blue - z))
  end

  def multi(x, y, z)
    Colorcito.new((@red * x), (@green * y), (@blue * z))
  end

  def show()
    puts @red.to_s + @green.to_s + @blue.to_s
  end
end