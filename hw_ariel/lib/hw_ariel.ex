defmodule Hw.Ariel1 do

  def fahrenheit_to_celsius(farenheid) do
    (farenheid - 32) * 5/9
  end

  def sign(n) do
    cond do
      n < 0 -> -1
      n == 0 -> 0
      n > 0 -> 1
    end
  end

  def roots(a, b, c) do
    d = (:math.pow(b, 2)) - (4 * a * c)
    cond do
      d < 0 -> "No roots"
      d == 0 -> -b / (2 * a)
      d > 0 -> {(-b + :math.sqrt(d)) / (2 * a), (-b - :math.sqrt(d)) / (2 * a)}
    end
  end

  def bmi(weight, height) do
    b = weight / (:math.pow(height, 2))
    cond do
      b < 20 -> :underweight
      b >= 20 and b < 25 -> :normal
      b >= 25 and b < 30 -> :obese1
      b >= 30 and b < 40 -> :obese2
      b >= 40 -> :obese3
    end
  end

  def factorial(n) do
    cond do
      n < 0 -> "Number must be positive"
      n == 0 -> 1
      n > 0 -> n * factorial(n - 1)
    end
  end

  def duplicate(list) do
    Enum.flat_map(list, fn(x) -> [x, x] end)
  end

  def pow(a, b) do
    cond do
      b < 0 -> "Number must be positive"
      b == 0 -> 1
      b > 0 -> :math.pow(a, b)
    end
  end

  def fib(n) do
    cond do
      n < 0 -> "Number must be positive"
      n == 0 -> 0
      n == 1 -> 1
      n > 1 -> fib(n - 1) + fib(n - 2)
    end
  end

  def enlist(list) do
    Enum.map(list, fn(x) -> [x] end)
  end

  def positives(list) do
    Enum.filter(list, fn(x) -> x > 0 end)
  end

  def add_list(list) do
    Enum.reduce(list, 0, fn(x, acc) -> x + acc end)
  end

  def invert_pairs(list) do
    Enum.map(list, fn{a, b} -> {b, a} end)
  end

  def is_atom_list(list) do
    Enum.all?(list, fn(x) -> is_atom(x) end)
  end

  def swapper(list, a, b) do #Error en el orden de argumentos en test
    Enum.map(list, fn
    x when x == a -> b
    x when x == b -> a
    x -> x
    end)
  end

  def dot_product(a, b) do
    Enum.reduce(Enum.zip(a, b), 0, fn {x, y}, acc -> x * y + acc end)
  end

  def average(list) do
    cond do
      length(list) == 0 -> 0
      true -> add_list(list) / length(list)
    end
  end

  def std_dev(list) do
    n = length(list)

    if n == 0 do
      0
    else
      m = average(list)
      :math.sqrt(Enum.reduce(list, 0, fn(x, acc) -> :math.pow(x - m, 2) + acc end) / n)
    end
  end

  def replic(n, list) do #Error en el orden de argumentos en test
    cond do
      n <= 0 -> [] # Maneja el caso en que n es 0 o negativo, devolviendo una lista vacía.
      true -> Enum.flat_map(list, fn(x) -> List.duplicate(x, n) end) # Para cualquier otro caso, procede como antes.
    end
  end

  def expand(list) do
    Enum.with_index(list)
    |> Enum.flat_map(fn {x, index} ->
      List.duplicate(x, index + 1)
    end)
  end

  def binary(n) do
    cond do
      n < 0 -> "Number must be positive"
      n == 0 -> []
      true -> Integer.to_string(n, 2)
      |> String.graphemes()
      |> Enum.map(&String.to_integer/1)
    end
  end

end
