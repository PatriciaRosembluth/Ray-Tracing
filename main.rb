require_relative 'ray_tracer'
require_relative 'sphere'
require_relative 'triangle'
renderer = RayTracer.new(640, 480)

first_sphere = Sphere.new(120, Vector3D.new(370.0, 120.0, 370.0))
first_sphere.diff_color = Colorcito.new(0.156, 0.126, 0.506)
first_sphere.specular_color = Colorcito.new(1.0, 1.0, 1.0)
first_sphere.specular_coef = 100.0


second_sphere = Sphere.new(100, Vector3D.new(130.0, 100.0, 130.0))
second_sphere.diff_color = Colorcito.new(0.656, 0.626, 0.107)
second_sphere.specular_color = Colorcito.new(0.0, 0.0, 0.0)
second_sphere.specular_coef = 1.0

first_triangle = Triangle.new(Vector3D.new(552.8, 0, 0),Vector3D.new(0, 0, 0), Vector3D.new(0, 0, 559.2))
first_triangle.diff_color = Colorcito.new(0.0, 0.4, 0.0)
first_triangle.specular_color = Colorcito.new(0.0, 0.0, 0.0)
first_triangle.specular_coef = 1.0

second_triangle = Triangle.new(Vector3D.new(552.8, 0, 0),Vector3D.new(0, 0, 559.2),Vector3D.new(549.6, 0, 552.8) )
second_triangle.diff_color = Colorcito.new(0.0, 0.4, 0.0)
second_triangle.specular_color = Colorcito.new(0.0, 0.0, 0.0)
second_triangle.specular_coef = 1.0

renderer.add_objects(first_triangle)
renderer.add_objects(second_triangle)
renderer.add_objects(first_sphere)
renderer.add_objects(second_sphere)
renderer.render('Raytracing', 'raytracing.png')