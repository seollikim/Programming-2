defmodule Shunt do

  def split(list, atom) do
    case TrainList.member(list, atom) do
      false -> :oops
      true -> {TrainList.take(list, TrainList.position(list, atom)-1), TrainList.drop(list, TrainList.position(list, atom))}
    end
  end

  def find(xs, ys) do
    case ys do
      [] -> []
      [y|t] ->
        {hs, ts} = split(xs, y)
        step = Moves.single({:one, length(ts)+1}, {xs, [], []})
        step = Moves.single({:two, length(hs)}, step)
        step = Moves.single({:one, -(length(ts)+1)}, step)
        {[_|t2], [], []} = Moves.single({:two, -(length(hs))},step)

        [{:one, length(ts)+1}, {:two, length(hs)}, {:one, -(length(ts)+1)}, {:two, -(length(hs))}| find(t2, t)]
      end
  end

  def few([u|k], [u|t]) do
    few(k, t)
  end
  def few(xs, ys) do
    case ys do
      [] -> []
      [y|t] ->
        {hs, ts} = split(xs, y)
        step = Moves.single({:one, length(ts)+1}, {xs, [], []})
        step = Moves.single({:two, length(hs)}, step)
        step = Moves.single({:one, -(length(ts)+1)}, step)
        {[_|t2], [], []} = Moves.single({:two, -(length(hs))}, step)

        [{:one, length(ts)+1}, {:two, length(hs)}, {:one, -{length(ts)+1}}, {:two, -(length(hs))}| few(t2, t)]
    end
  end

end
