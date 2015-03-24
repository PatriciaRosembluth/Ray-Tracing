require_relative 'objeto'
require_relative 'vector3d'

class Triangle < Objeto
  attr_accessor :a, :b, :c

  def initialize(a, b, c)
    super(Colorcito.new(0.0,0.0,0.0), Colorcito.new(0.0,0.0,0.0), 0.0)
    @a = a
    @b = b
    @c = c
  end

  def intersect(e, d)

    m1 = ((@a.x - @b.x)*(((@a.y - @c.y)*d.z) - ((@a.z - @c.z)*d.y)))
    m2 = ((@a.y - @b.y)*(((@a.z - @c.z)*d.x) - ((@a.x - @c.x)*d.z)))
    m3 = ((@a.z - @b.z)*(((@a.x - @c.x)*d.y) - ((@a.y - @c.y)*d.x)))

    m = m1 + m2 + m3

    beta1 = ((@a.x - e.x)*(((@a.y - @c.y)*d.z) - ((@a.z - @c.z)*d.y)))
    beta2 = ((@a.y - e.y)*(((@a.z-@c.z)*d.x) - ((@a.x - @c.x)*d.z)))
    beta3 = ((@a.z - e.z)*(((@a.x - @c.x)*d.y) - ((@a.y - @c.y)*d.x)))

    gama1 = ((d.z)*(((@a.x - @b.x)*(@a.y - e.y)) - ((@a.x - e.x)*(@a.y - @b.y))))
    gama2 = ((d.y)*(((@a.x - e.x)*(@a.z - @b.z)) - ((@a.x - @b.x)*(@a.z - e.z))))
    gama3 = ((d.x)*(((@a.y - @b.y)*(@a.z - e.z)) - ((@a.y - e.y)*(@a.z - @b.z))))

    tau1 = ((@a.z - @c.z)*(((@a.x - @b.x)*(@a.y - e.y)) - ((@a.x - e.x)*(@a.y - @b.y))))
    tau2 = ((@a.y - @c.y)*(((@a.x - e.x)*(@a.z - @b.z)) - ((@a.x - @b.x)*(@a.z - e.z))))
    tau3 = ((@a.x - @c.x)*(((@a.y - @b.y)*(@a.z - e.z)) - ((@a.y - e.y)*(@a.z - @b.z))))

    beta = (beta1 + beta2 + beta3) / m
    gama = (gama1 + gama2 + gama3) / m
    tau = -((tau1 + tau2 + tau3) / m)

    if tau >= 0
      if gama>=0 && gama<=1
        if beta>=0 && beta<=(1-gama)
          t = tau
        else
          t = +1.0/0.0
        end
      else
        t = +1.0/0.0
      end
    else
      t = +1.0/0.0
    end
    t

  end

  def set_normal(p)
      aux1 = @b.minus(@a)
      aux2 = @c.minus(@a)
      aux3 = aux1.cross_product(aux2)
      @normal = aux3.scalar_division(aux3.mod)
  end
end