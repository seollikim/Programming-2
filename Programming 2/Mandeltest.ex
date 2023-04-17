defmodule Test do
  def demo() do
      small(-1.3, 2.1, 4.1)
  end

  def small(x, y, n) do
    width = 960
    height = 540
    depth = 64
    image = Mandel.mandelbrot(width, height, x, y, (n - x)/width, depth)
    PPM.write("small.ppm", image)
  end
end
