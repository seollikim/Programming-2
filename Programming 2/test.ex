defmodule Test do
  def double(n) do
    2*n
  end


  def degrees(n) do
  (n-32)/1.8
  end

  def aor(b,h) do
    b*h
  end

  def rectangle(a,b) do
    a*b
  end

  def square(n) do
    rectangle(n,n)
  end

  def circlearea(r) do
    :math.pi*r*r
  end

end

defmodule Recursive do
  def product(m, n) do
    if m == 0 do
      0
    else
      n + product(m-1,n)
    end
  end

  def product_case(m,n) do
    case m do
      0 ->
        0
      _ ->
        n + product_case(m-1, n)
    end
  end

  def product_cond(m, n) do
    cond do
      m == 0 ->
      0
      true ->
        n + product_cond(m-1,n)
    end
  end

end
