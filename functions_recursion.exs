#Solution of activity 2.1 Functional Programming
#
#Use of recursion, recursion tail, pattern matching, functions and modules
#
#José Manuel García Zumaya A01784238
#29 - 02 - 2024

defmodule Hw.Ariel1 do

  def invert(list), do: invert(list, [])
  defp invert([], res), do: res
  defp invert([head | tail], res), do: invert(tail, [head | res])

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
      d > 0 -> {(-b + d**(1/2)) / (2 * a), (-b - d**(1/2)) / (2 * a)}
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

  def factorial(n) when n < 0, do: :error
  def factorial(0), do: 1
  def factorial(n), do: n * factorial(n - 1)

  def duplicate(list), do: duplicate(list, [])
  defp duplicate([], res), do: invert(res)
  defp duplicate([head | tail], res), do: duplicate(tail, [head, head | res])

  def pow(a, b) do
    cond do
      b < 0 -> "Number must be positive"
      b == 0 -> 1
      b > 0 -> a**b
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

  def enlist(list), do: enlist(list, [])
  defp enlist([], res), do: invert(res)
  defp enlist([head | tail], res), do: enlist(tail, [[head] | res]) #Al reves resulta en lista anidada por [elemento, lista] y estarias haciendo [lista | [lista]], donde [lista] es un elemento que se agrega a la lista entonces se anida

  def positives(list), do: positives(list, [])
  defp positives([], res), do: invert(res)
  defp positives([head | tail], res) do
    cond do
      head > 0 -> positives(tail, [head | res])
      true -> positives(tail, res)
    end
  end

  def add_list(list), do: add_list(list, 0)
  defp add_list([], acc), do: acc
  defp add_list(list, acc), do: add_list(tl(list), acc + hd(list))

  def invert_pairs(list), do: invert_pairs(list, [])
  defp invert_pairs([], res), do: invert(res)
  defp invert_pairs([head | tail], res) do
    {a, b} = head
    invert_pairs(tail, [{b, a} | res])
  end

  def is_atom_list([]), do: true
  def is_atom_list([head | tail]) do
  if is_atom(head) do
    is_atom_list(tail)
  else
    false
    end
  end

  def swapper(list, a, b), do: swapper(list, a, b, [])
  defp swapper([], _a, _b, res), do: invert(res)
  defp swapper([head | tail], a, b, res) do
    cond do
      head == a -> swapper(tail, a, b, [b | res])
      head == b -> swapper(tail, a, b, [a | res])
      true -> swapper(tail, a, b, [head | res])
    end
  end

  def dot_product(a, b) when length(a) != length(b), do: :error
  def dot_product(a, b), do: dot_product(a, b, 0)
  defp dot_product([], [], acc), do: acc
  defp dot_product([ha | ta], [hb | tb], acc) do
    dot_product(ta, tb, ha * hb + acc)
  end

  def average(list), do: average(list, 0, length(list))
  defp average([], _acc, 0), do: 0
  defp average([], acc, len), do: acc / len
  defp average([head | tail], acc, len), do: average(tail, head + acc, len)

  def std_dev(list), do: std_dev(list, 0, length(list), average(list))
  defp std_dev([], _acc, 0, _mean), do: 0
  defp std_dev([], acc, len, _mean), do: (acc / len) ** (1/2)
  defp std_dev([head | tail], acc, len, mean), do: std_dev(tail, ((head - mean) ** 2) + acc, len, mean)

  defp replicate_element(element, n), do: replicate_element(element, n, [])
  defp replicate_element(_element, 0, res), do: res
  defp replicate_element(element, n, res), do: replicate_element(element, n - 1, [element | res]) # | El primero en ingresar sera el ultimo en la lista resultante ya que es FIFO

  def replic(n, list), do: replic(n, list, [])
  defp replic(_n, [], res), do: invert(res)
  defp replic(n, [head | tail], res), do: replic(n, tail, replicate_element(head, n) ++ res)

  def expand(list), do: expand(invert(list), [], length(list))
  defp expand([], res, _len), do: res
  defp expand([head | tail], res, len), do: expand(tail, replicate_element(head, len) ++ res, len - 1) #Notar que ++ no manda al head al final, lo conserva en principio es suma de listas

  def binary(n), do: binary(n, [])
  defp binary(0, res), do: res
  defp binary(n, res), do: binary(div(n, 2), [rem(n, 2) | res])

end
