require_relative 'color'
class Objeto
  attr_accessor :difuse_color, :specular_color, :specular_coef

  def initialize(dc, ds, coef)
    @difuse_color = dc
    @specular_color = ds
    @specular_coef = coef
  end

  def intersect(e, d)
  end
end