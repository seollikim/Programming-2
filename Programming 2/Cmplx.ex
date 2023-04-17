defmodule Cmplx do
    def new(x,y) do
      {x, y}
    end

    def add({x1, y1}, {x2, y2}) do
      {x1 + x2, y1 + y2}
    end
    def sqr({x, y}) do
        {x*x-y*y, 2*x*y}
    end
    def abs({x, y}) do
      :math.sqrt(x * x + y* y)
    end

end
