require_relative 'vector3d'

class Camera
  attr_accessor :e, :up, :pv, :fov, :df, :dv, :v_vector, :u_vector, :w_vector, :nx, :ny

  def initialize(e, up, pv, fov, df, nx, ny)
    @v_vector = Vector3D.new(0.0, 0.0, 0.0)
    @w_vector = Vector3D.new(0.0, 0.0, 0.0)
    @u_vector = Vector3D.new(0.0, 0.0, 0.0)
    @e = e
    @up = up
    @pv = pv
    @fov = fov * 0.0174532925
    @df = df
    @dv = @pv.minus(@e)
    @v_vector = get_v
    @w_vector = get_w
    @u_vector = get_u
    @nx = nx
    @ny = ny
  end

  def get_v
    @up.scalar_division(@up.mod)
  end
  
  def get_w
    aux = Vector3D.new(0.0, 0.0, 0.0)
    aux.x = -@dv.x
    aux.y = -@dv.y
    aux.z = -@dv.z
    aux.scalar_division(@dv.mod)
  end

  def get_u
    (@v_vector.cross_product(@w_vector)).scalar_division((@v_vector.cross_product(@w_vector)).mod)
  end

  def get_d(i, j)
    t = @df * Math.tan(@fov/2)
    r = (@nx/@ny)*t
    l = -r
    b = -t
    u = l + (r-l)*((i + 0.5)/@nx)
    v = b + (t-b)*((j + 0.5)/@ny)
    aux = -@df
    res = Vector3D.new(0.0, 0.0, 0.0)
    var1 = @w_vector.scalar_product(aux)
    var2 = @u_vector.scalar_product(u)
    var3 = @v_vector.scalar_product(v)

    res = res.add(var1.add(var2.add(var3)))

  end
end