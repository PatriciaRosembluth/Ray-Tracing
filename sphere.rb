require_relative 'objeto'

class Sphere < Objeto

  attr_accessor :radius, :center

  def initialize(radio, center)
    super(Colorcito.new(0.0, 0.0, 0.0),Colorcito.new(0.0, 0.0, 0.0),0.0)
    @radius = radio
    @center = center
  end

  def intersect(e, d)
    auxiliar = Vector3D.new(0.0,0.0,0.0)
    auxiliar.x = -d.x
    auxiliar.y = -d.y
    auxiliar.z = -d.z

    var1 = auxiliar.dot_product(e.minus(@center))
    var2 = (d.dot_product(e.minus(@center)))**2
    var3 = d.dot_product(d)
    var4 = ((e.minus(@center)).dot_product(e.minus(@center)) - (@radius)**2)

    if (var2-var3*var4) < 0
      t = +1.0/0.0
    else
      t1 = (var1 - Math.sqrt(var2-var3*var4)) / var3
      t2 = (var1 + Math.sqrt(var2-var3*var4)) / var3
      if t1<t2
        t = t1
      else
        t = t2
      end
    end
    t
  end

  def set_normal(p)
    x = p.minus(@center)
    t = x.scalar_division(@radius)
    @normal = t.scalar_division(t.mod)
  end
end