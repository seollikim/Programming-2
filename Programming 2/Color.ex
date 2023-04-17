defmodule Color do
  def convert(d, max) do
    a = (d / max) * 4
    x = trunc(a)
    y = trunc(255 * (a - x))

    case x do
      0 ->
        # black -> red
        {:rgb, 128, 0, y} #me

      1 ->
        # red -> pink
        {:rgb, 255, y, 255} #me

      2 ->
        # pink -> greenblue
        {:rgb, 0, 204, 255 - y} #me

      3 ->
        # green -> yellow
        {:rgb, y, 255, 0}

      4 ->
        # yellow-> red
        {:rgb, 153, 255 - y, 102}
    end
  end
end
