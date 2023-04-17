defmodule Cmplx do

def new(r, i) do {r, i} end
def add({ar, ai}, {br, bi}) do {ar + br, ai + bi} end
def sqr({xr, xi}) do {xr * xr - xi * xi, 2 * xr * xi} end
def abs({x, y}) do :math.sqrt(x*x + y*y) end

end
