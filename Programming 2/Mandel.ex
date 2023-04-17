defmodule Mandel do
    def mandelbrot(width, height, x, y, k, depth) do
      trans = fn(w,h) ->
        Cmplx.new(x + k * (w-1), y - k * (h - 1))
      end

      rows(width, height, trans, depth, [])
    end

    def rows(_, 0, _, _, rows), do: rows
    def rows(w, h, trans, depth, rows) do
      row = row(w, h, trans, depth, [])
      rows(w, h - 1, trans, depth, [row | rows])
    end

    def row(0, _, _, _, row), do: row
    def row(w, h, trans, depth, row) do
      c = trans.(w, h)
      res = Brot.mandelbrot(c, depth)
      color = Color.convert(res, depth)
      row(w - 1, h, trans, depth, [color | row])
    end
  end
