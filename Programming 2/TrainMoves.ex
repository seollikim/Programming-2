defmodule Moves do
  def single({:one, n}, {main, one, two}) do
    cond do
      length(main) - n < 0 ->
        {main, one, two}
      n < 0 ->
        {TrainList.append(main, TrainList.take(two, n*-1)), one, TrainList.drop(two, n*-1)}
      n > 0 ->
        {TrainList.take(main, length(main)-n), TrainList.append(TrainList.drop(main, length(main)-n), one), two}
      true -> {main, one, two}
    end
  end

  def single({:two, n}, {main, one, two}) do
    cond do
      length(main) -n < 0 ->
        {main, one, two}
      n < 0 ->
        {TrainList.append(main, TrainList.take(two, n*-1)), one, TrainList.drop(two, n*-1)}
      n > 0 ->
        {TrainList.take(main, length(main)-n), one, TrainList.drop(two, n*-1)}
      true -> {main, one, two}
    end
  end

  def move(moves, state) do
    case moves do
      [] -> [state]
      [h|t] -> [state | move(t, single(h,state))]
    end
  end
end
