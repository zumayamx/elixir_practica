#Solution of activity 2.1 Functional Programming
#
#Use of Enum.map, Enum.filter, Enum.reduce, Enum.flat_map, Enum.zip, Enum.all?, Enum.with_index
#
#José Manuel García Zumaya A01784238
#29 - 02 - 2024

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
    d = (b**2) - (4 * a * c)
    cond do
      d < 0 -> "No roots"
      d == 0 -> -b / (2 * a)
      d > 0 -> {(-b + :math.sqrt(d)) / (2 * a), (-b - :math.sqrt(d)) / (2 * a)}
    end
  end

  def bmi(weight, height) do
    b = weight / (height ** 2)
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
      true -> n * factorial(n - 1)
    end
  end

  #Using pattern matching and guards to cerate different functions for factorial
  def fact_3(n) when n < 0, do: :error
  def fact_3(0), do: 1
  def fact_3(n), do: n * fact_3(n - 1)

  #public function of factorial_tail
  def factorial_tail(n), do: factorial_tail(n, 1)
  #private functions, para que el ususario no pueda que pasar el acumulador, es decir factorial_tal/2 es llamada solamente con acc 1
  defp factorial_tail(n, _a) when n < 0, do: :error #pattern matching and guards
  defp factorial_tail(0, a), do: a #Atencion en lo que retorna
  defp factorial_tail(n, a), do: factorial_tail(n - 1, n * a) #No hay operacion fuera de la llamada recursiva

  def duplicate(list) do
    Enum.flat_map(list, fn(x) -> [x, x] end)
  end

  def pow(a, b) do
    cond do
      b < 0 -> "Number must be positive"
      b == 0 -> 1
      b > 0 -> a**b
    end
  end

  #def pow_r(a, b) do
    #recursivas
  #end

  def fib(n) do
    cond do
      n < 0 -> "Number must be positive"
      n == 0 -> 0
      n == 1 -> 1
      n > 1 -> fib(n - 1) + fib(n - 2)
    end
  end

  def size(list) do
    cond do
      list == [] -> 0
      true -> size(tl(list)) + 1
    end
  end

  #Recursion con tail
  def size_r(list), do: do_size(list, 0)

  defp do_size([], len), do: len
  defp do_size(list, len), do: do_size(tl(list), len + 1)

  def sum(list), do: sum_list(list, 0)

  defp sum_list([], acc), do: acc
  defp sum_list(list, acc), do: sum_list(tl(list), acc + hd(list))

  #Nueva clase, construir listas, pattern matching, puedo meter lo de la izquierda en las cajas de la derecha, sin que quede nada fuera
  #Encontrar la funcion de la izquierda

  def make_nums_1(n), do: make_nums_1(n, [])

  defp make_nums_1(0, res), do: res #IO.inspect binding()
  defp make_nums_1(n, res), do: make_nums_1(n - 1, [n] ++ res)

  def make_nums_2(n), do: make_nums_2(n, [])

  defp make_nums_2(0, res), do: res
  defp make_nums_2(n, res) do
    IO.inspect binding()
    make_nums_2(n - 1, [n | res])
  end

  def enlist(list) do
    Enum.map(list, fn(x) -> [x] end)
  end

  def invert_1(list), do: invert_1(list, [])
  defp invert_1([], res), do: res
  defp invert_1([head | tail], res), do: invert_1(tail, [head, res])

  def enlist_1(list), do: enlist_1(list, [])

  defp enlist_1([], res), do: invert_1(res)
  defp enlist_1([head | tail], res), do: enlist_1(tail, [[head] | res]) #Al reves lista anidada, porque ?

  def positives_1(list), do: positives_1(list, [])

  defp positives_1([], res), do: invert_1(res)
  defp positives_1([head | tail], res) do
    cond do
      head > 0 -> positives_1(tail, [head | res])
      true -> positives_1(tail, res)
    end
  end

  def positives(list) do
    Enum.filter(list, fn(x) -> x > 0 end)
  end

  def add_list(list) do
    Enum.reduce(list, 0, fn(x, acc) -> x + acc end)
  end

  def invert_pairs_1(list), do: invert_pairs_1(list, [])

  defp invert_pairs_1([], res), do: invert_1(res)
  defp invert_pairs_1([head | tail], res) do
    head_i = invert_1(head)
    invert_pairs_1(tail, [head_i | res])
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


IO.puts(Hw.Ariel1.size([1, 2, 3, 4, 5]))
IO.puts(Hw.Ariel1.size_r([1, 2, 3, 4, 5]))
IO.puts(Hw.Ariel1.sum([1, 2, 3, 4, 5]))

IO.inspect(Hw.Ariel1.make_nums_1(7))
IO.inspect(Hw.Ariel1.make_nums_2(7))

IO.inspect(Hw.Ariel1.enlist_1([1, 2, 3, 4, 5]))

IO.inspect(Hw.Ariel1.positives_1([1, 2, -3, -4, 5, -9]))

IO.inspect((Hw.Ariel1.invert_pairs_1([[1, 2], [2, 4]])))
