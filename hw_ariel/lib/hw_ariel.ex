#Solution of activity 2.1 Functional Programming
#
#Use of recursion, recursion tail, pattern matching, functions and modules
#
#José Manuel García Zumaya A01784238
#7 - 03 - 2024

defmodule Hw.Ariel1 do

  #Function to invert a list element by element
  def invert(list), do: invert(list, [])
  defp invert([], res), do: res
  defp invert([head | tail], res), do: invert(tail, [head | res])

 #Function to transform F° to C°
  def fahrenheit_to_celsius(farenheid) do
    (farenheid - 32) * 5/9
  end

  def sign(n) do
    cond do
      n < 0 -> -1 #If n es menor a o, return -1
      n == 0 -> 0
      n > 0 -> 1 #Otherwise retun  0 or 1
    end
  end

  def roots(a, b, c) do
    d = (b**2) - (4 * a * c) #Compute the numerator of formula
    cond do
      d < 0 -> "No roots"
      d == 0 -> -b / (2 * a)
      d > 0 -> {(-b + d**(1/2)) / (2 * a), (-b - d**(1/2)) / (2 * a)} #If d > 1, return two solutions in a tuple
    end
  end

  def bmi(weight, height) do
    b = weight / (height ** 2) #Compute the bmi
    cond do
      b < 20 -> :underweight
      b >= 20 and b < 25 -> :normal
      b >= 25 and b < 30 -> :obese1 #If bmi is in someone of this conditions return an atom
      b >= 30 and b < 40 -> :obese2
      b >= 40 -> :obese3
    end
  end

  #Function to compute the factorial of positive number
  def factorial(n) when n < 0, do: :error #Guards that n is > 0
  def factorial(0), do: 1 #Base case
  def factorial(n), do: n * factorial(n - 1) #Recursion step, n - 1 until reach base case

  #Function to duplicate a list element by element with recursion
  def duplicate(list), do: duplicate(list, [])
  defp duplicate([], res), do: invert(res) #Base case, invert de final list, cause the first element in the recursive step is the final in the res
  defp duplicate([head | tail], res), do: duplicate(tail, [head, head | res]) #Recursive step, call the function until tail is a empty list, and concatenate the head two times in the res

  #Take a number a and pow to b
  def pow(a, b) do
    cond do #Condition, if b > 0, return the a pow b, any number pow 0 is equals to 1
      b < 0 -> "Number must be positive"
      b == 0 -> 1
      b > 0 -> a**b
    end
  end

  #Compute de fib secuence until n number
  def fib(n) do
    cond do
      n < 0 -> "Number must be positive"
      n == 0 -> 0 #Basis
      n == 1 -> 1 #Basis
      n > 1 -> fib(n - 1) + fib(n - 2) #Recursive step, return the sum of the two last numbers, n -  1, n - 2 until reach to base case
    end
  end

  #Function enlist a element in a list
  def enlist(list), do: enlist(list, []) #defp, necesary to don´t allow to the user to call this functions
  defp enlist([], res), do: invert(res) #Basis case, invert the res cause the first element in the recursive step is the final in the res by [head | res]
  defp enlist([head | tail], res), do: enlist(tail, [[head] | res]) #Recursive step, enlist the head in res and tail to new parameter in enlist until reach the basis case

  #Function to take only the positive numbers of a list
  def positives(list), do: positives(list, [])
  defp positives([], res), do: invert(res) #Basis case, invert the res by the reason previusly explained
  defp positives([head | tail], res) do #Resursive step
    cond do
      head > 0 -> positives(tail, [head | res]) #If head is positive, concatenate in res, otherwise call function whit tail, without afect res
      true -> positives(tail, res)
    end
  end

  #Function to sum all elements of the list
  def add_list(list), do: add_list(list, 0)
  defp add_list([], acc), do: acc #Basis case
  defp add_list(list, acc), do: add_list(tl(list), acc + hd(list)) #Recursive step, sum the acc with head of list

  #Function to invert elements of a tuple in list
  def invert_pairs(list), do: invert_pairs(list, [])
  defp invert_pairs([], res), do: invert(res)
  defp invert_pairs([head | tail], res) do
    {a, b} = head
    invert_pairs(tail, [{b, a} | res]) #Invert the tuple and concatenate with res
  end

  #Function to probe that a list of atoms
  def is_atom_list([]), do: true
  def is_atom_list([head | tail]) do
  if is_atom(head) do
    is_atom_list(tail)
  else
    false
    end
  end

  #Function to change the a occurrences with b and de b ocurrences with a
  def swapper(list, a, b), do: swapper(list, a, b, [])
  defp swapper([], _a, _b, res), do: invert(res)
  defp swapper([head | tail], a, b, res) do
    cond do
      head == a -> swapper(tail, a, b, [b | res]) #If head == a, concatenate b with res and vice versa
      head == b -> swapper(tail, a, b, [a | res])
      true -> swapper(tail, a, b, [head | res]) #Otherwise concatenate head
    end
  end

  #Function to compute the dot product of two list
  def dot_product(a, b) when length(a) != length(b), do: :error #Guards that both list have the same length
  def dot_product(a, b), do: dot_product(a, b, 0)
  defp dot_product([], [], acc), do: acc
  defp dot_product([ha | ta], [hb | tb], acc) do
    dot_product(ta, tb, ha * hb + acc) #Recursive step, head of a * head of b, ultil basis case []
  end

  #Function to compute the average of a sum of elements of a list
  def average(list), do: average(list, 0, length(list))
  defp average([], _acc, 0), do: 0
  defp average([], acc, len), do: acc / len #Return acc divide by len to average
  defp average([head | tail], acc, len), do: average(tail, head + acc, len) #Recursive step,  head  + acc

  #Function to compute the standar desviaton of elemets in list
  def std_dev(list), do: std_dev(list, 0, length(list), average(list))
  defp std_dev([], _acc, 0, _mean), do: 0
  defp std_dev([], acc, len, _mean), do: (acc / len) ** (1/2)
  defp std_dev([head | tail], acc, len, mean), do: std_dev(tail, ((head - mean) ** 2) + acc, len, mean) #Recursive step

  #Function to replicate a element of a list, and return list of n replicate element
  defp replicate_element(element, n), do: replicate_element(element, n, [])
  defp replicate_element(_element, 0, res), do: res
  defp replicate_element(element, n, res), do: replicate_element(element, n - 1, [element | res]) #Recursive step

  #Function to replic the element in a list n times
  def replic(n, list), do: replic(n, list, [])
  defp replic(_n, [], res), do: invert(res)
  defp replic(n, [head | tail], res), do: replic(n, tail, replicate_element(head, n) ++ res) #Concatenate the list replicate_element with res list

  #Function to expand the elements in list n + 1 times ultil length of list
  def expand(list), do: expand(invert(list), [], length(list)) #Invert list in the parametrer
  defp expand([], res, _len), do: res
  defp expand([head | tail], res, len), do: expand(tail, replicate_element(head, len) ++ res, len - 1) #Recursive step,  the first element of list replicate len times, amd lem - 1 until reach basis case

  #Function to convert decimal number to binary number
  def binary(n), do: binary(n, [])
  defp binary(0, res), do: res #It´s not neccesary inver the res cause the div in the recursie step is invert already
  defp binary(n, res), do: binary(div(n, 2), [rem(n, 2) | res]) #Recursive step, didvide n by 2 until 0, and takes the rem to concatenate with res

end
