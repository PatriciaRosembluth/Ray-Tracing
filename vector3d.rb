class Vector3D
	attr_accessor :x, :y, :z

	def initialize(pos_x, pos_y, pos_z)
		@x = pos_x
		@y = pos_y
		@z = pos_z
	end

  def add(vector)
    vec_res = Vector3D.new((@x + vector.x), (@y + vector.y), (@z + vector.z))
  end

  def minus(vector)
    vec_res = Vector3D.new((@x - vector.x), (@y - vector.y), (@z - vector.z))
  end

  def dot_product(vector)
    res = (@x*vector.x)+(@y*vector.y)+(@z*vector.z)
  end

  def cross_product(vector)
    res = Vector3D.new((@y*vector.z - @z*vector.y),(@z*vector.x-@x*vector.z),(@x*vector.y - @y*vector.x))
  end

  def mod
    res = Math.sqrt((@x**2)+(@y**2)+(@z**2))
  end

  def scalar_division(var)
    variable = var.to_f
    x = @x * (1 / variable)
    y = @y * (1 / variable)
    z = @z * (1 / variable)
    res = Vector3D.new(x, y, z)
    return res
  end

  def scalar_product(variable)
    x = @x * variable
    y = @y * variable
    z = @z * variable
    res = Vector3D.new(x, y, z)
  end

  def show
    puts @x.to_s + " " + @y.to_s + " " + @z.to_s
  end
end




