defmodule FirstSolution do

  def first(n) do
    list = [h|t] = Enum.to_list(2..n)
    [h|delete(h, t)]
  end

  def delete(x, []) do
    []
  end

  def delete(x, [h|t]) do
    [h|delete(h, Enum.filter(t, fn f -> rem(f, x) != 0 end))]
  end

end

defmodule SecondSolution do

  def second(n) do
      list = Enum.to_list(2..n)
      second(list, [])
  end

  def insertP(boolean, x, primes) do
      case boolean do
          true -> primes ++ [x]
          false -> primes
      end
  end

      def checkP(_, []) do
        true end
  def checkP([h|t], primes = [h2|t2]) do
      cond do
          rem(h, h2) == 0 ->
              false
          true -> checkP([h|t], t2)
      end
  end

  def second(list, primes) do
      case list do
          [] -> primes
          [h|t] ->
              boolean = checkP(list, primes)
              primes = insertP(boolean, h, primes)
              second(t, primes)
      end
  end
end

  defmodule ThirdSolution do

    def third(n) do
      list = Enum.to_list(2..n)
      third(list, [])
    end
    def insertP(boolean, x, primes) do
      case boolean do
          true -> [x] ++ primes
          false -> primes
      end
    end
    def checkP(_, []) do
      true end
    def checkP([h|t], primes =[h2|t2]) do
      cond do
        rem(h, h2) == 0 ->
          false
        true -> checkP([h|t], t2)
      end
    end

    def third(list, primes) do
      case list do
        [] -> Enum.reverse(primes)
        [h|t] ->
          bool = checkP(list, primes)
          primes = insertP(bool, h, primes)
          third(t, primes)
      end
    end
  end

  defmodule Timer do
    def timer(n) do
      IO.inspect(:timer.tc(fn -> FirstSolution.first(n) end))
      IO.inspect(:timer.tc(fn -> SecondSolution.second(n) end))
      IO.inspect(:timer.tc(fn -> ThirdSolution.third(n) end))

      :ok
    end
  end
