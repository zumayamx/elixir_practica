#Solution of activity 3.1 Functional Programming Part 2
#
#Use of recursion, recursion tail, pattern matching, functions and modules
#Use of functions created in the previous activity
#
#José Manuel García Zumaya A01784238
#Bruno Avendaño Toledo A01784613
#03 - 04 - 2024

defmodule Hw.Ariel2 do

  #Function to invert a list element by element
  def invert(list), do: invert(list, [])
  defp invert([], res), do: res
  defp invert([head | tail], res), do: invert(tail, [head | res])

  #Function to replicate a element of a list, and return list of n replicate element
  defp replicate_element(element, n), do: replicate_element(element, n, [])
  defp replicate_element(_element, 0, res), do: res
  defp replicate_element(element, n, res), do: replicate_element(element, n - 1, [element | res])


  defp next_prime(n) do
    cond do
      rem(n, n) == 0 and rem(n, 1) == 0 -> n
      true -> next_prime(n + 1)
    end
  end

  defp unique_elements(list), do: unique_elements(list, [])
  defp unique_elements([], res), do: invert(res)
  defp unique_elements([head | tail], res) do
    if head in res do
      unique_elements(tail, res)
    else
      unique_elements(tail, [head | res])
    end
  end

  defp common_elements(list1, list2), do: common_elements(list1, list2, [])
  defp common_elements([], _list2, res), do: invert(res)
  defp common_elements([head | tail], list2,  res) do
    if head in list2 do
      common_elements(tail, list2, [head | res])
    else
      common_elements(tail, list2, res)
    end
  end

  defp multiply_elements(list), do: multiply_elements(list, 1)
  defp multiply_elements([], res), do: res
  defp multiply_elements([head | tail], res), do: multiply_elements(tail, head * res)

  def insert(list, n) do
    cond do
      list == [] -> [n]
      true -> insert([], list, n)
    end
  end

  defp insert(list), do: list
  defp insert(left, [head | tail], n) do
    cond do
      tail != [] and n > head and n < hd(tail) -> insert(left ++ [head] ++ [n] ++ tail)
      tail != [] and n < head and n < hd(tail) -> insert(left ++ [n] ++ [head |tail])
      tail == [] and n < head -> insert(left ++ [n] ++ [head])
      tail == [] and n >= head -> insert(left ++ [head] ++ [n])
      true -> insert(left ++ [head], tail, n)
    end
  end

  def insertion_sort(list) do
    cond do
      list == [] -> []
      true -> insertion_sort([], list)
    end
  end

  defp insertion_sort(sort_list, list) do
    if list == [] do
      sort_list
    else
      [head | tail] = list #no puedo creer que esto funciono
      cond do
        length([head | tail]) >= 0 -> insertion_sort(insert(sort_list, head), tail)
        true -> sort_list
      end
    end
  end

  def rotate_left(list, n) do
    [head | tail] = list
    r = length(list) - abs(n)
    cond do
      n == 0 -> list
      n > 0 -> rotate_left(tail ++ [head], n - 1)
      r == 0 -> list
      r < 0 -> rotate_left(list, length(list) - rem(abs(n), length(list)))
      r > 0 -> rotate_left(list, length(list) - abs(n))
    end
  end

  def prime_factors(n), do: prime_factors(n, [], 2)
  defp prime_factors(1, res, _prime), do: invert(res)
  defp prime_factors(n, res, prime) do
    cond do
      rem(n, prime) == 0 -> prime_factors(div(n, prime), [prime | res], prime)
      true -> prime_factors(n, res, next_prime(prime + 1))
    end
  end

  def gcd(a, b) do
    cond do
      b == 0 -> a
      a == 0 -> b
      a > 0 and b > 0 -> multiply_elements(unique_elements(common_elements(prime_factors(a), prime_factors(b))))
    end
  end

  def deep_reverse(list), do: deep_reverse(list, [])
  defp deep_reverse([], res), do: res
  defp deep_reverse([head | tail], res) do
    cond do
      is_list(head) -> deep_reverse(tail, [deep_reverse(head, []) | res])
      true -> deep_reverse(tail, [head | res])
    end
  end

  # def insert_everywhere(list, n) do
   # cond do
    #  list == [] -> [n]
     # true -> insert_everywhere([], list, n)
   # end
 # end

 # defp insert_everywhere(n, list), do: [n] ++ list
 # defp insert_everywhere(left, [head | tail], n), do: insert_everywhere(n, [left | tail])

  def pack(list), do: pack(list, [], [])
  defp pack([], _elist, res), do: invert(res)
  defp pack([head | tail], elist, res) do
    cond do
      tail != [] and head == hd(tail) -> pack(tail, [head | elist], res)
      true -> pack(tail, [], [[head | elist] | res])
    end
  end

  def encode(list), do: encode(list, [], 0)
  defp encode([], res, _acc), do: invert(res)
  defp encode([head | tail], res, acc) do
    cond do
      tail != [] and head == hd(tail) -> encode(tail, res, acc + 1)
      true -> encode(tail, [{acc + 1, head} | res], 0)
    end
  end

  def decode(list), do: decode(list, [])
  defp decode([], res), do: res
  defp decode([head | tail], res) do
    cond do
      is_tuple(head) -> {a, b} = head
      decode(tail, res ++ replicate_element(b, a))
      true -> decode(tail, res ++ [head])
    end
  end

end
