require_relative 'renderer'
require_relative 'camera'
require_relative 'light'

class RayTracer < Renderer

  attr_accessor :objects, :camera, :light

  def initialize(width, height)
    super(width, height, 0.0, 0.0, 0.0)
    @objects = Array.new
    @camera = Camera.new(Vector3D.new(278.0, 273.0, -800.0), Vector3D.new(0.0, 1.0, 0.0), Vector3D.new(278.0, 273.0, -700), 39.31, 0.035, width, height)
    @light = Light.new(Colorcito.new(0.8, 0.7, 0.6), Vector3D.new(278.0, 547.0, 279.5))
    @environment_color = Colorcito.new(0.2, 0.2, 0.2)
  end

  def calculate_pixel(i, j)
    {red: i.to_f / width, green: j.to_f / height, blue: 1.0}
    e = @camera.e
    d = @camera.get_d(i,j)
    tmin =  +1.0/0.0
    oint = nil
    @objects.each do |object|
      t = object.intersect(e, d)
      if(t < tmin)
        tmin = t
        oint = object
      end
    end
    if oint.nil?
      color = Colorcito.new(0.0, 0.0, 0.0)
    else
      p = e.add(d.scalar_product(tmin))
      oint.set_normal(p)
      aux= @light.location.minus(p)
      l = aux.scalar_division(aux.mod)
      color_aux1 = oint.diff_color

      aux2 = e.minus(p)
      v = aux2.scalar_division(aux2.mod)
      aux3 = v.add(l)
      h = aux3.scalar_division(aux3.mod)

      pre_color = oint.blinn_phong_shading(@light, h, l)
      ambiente_difuso = @environment_color.multi(oint.diff_color.red, oint.diff_color.green, oint.diff_color.blue )
      color = pre_color.add(ambiente_difuso.red, ambiente_difuso.green, ambiente_difuso.blue)

      @objects.each do |object|
        taux1 =  +1.0/0.0
        if object != oint
          if object.instance_of? Sphere
            t = object.intersect(p, l)
            if t < taux1
              taux1 = t
              color = color_aux1.multi(@environment_color.red, @environment_color.green, @environment_color.blue)
            end
          end
        end
      end

    end
    {red: color.red, green: color.green, blue: color.blue}
  end

  def add_objects(object)
    @objects << object
  end
end