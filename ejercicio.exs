IO.puts "Hola mundo de elixir"

defmodule Math do
  def factorial(0), do: 1
  def factorial(n) when n > 0, do: n * factorial(n - 1)
end

IO.puts "El factorial de 5 es #{Math.factorial(5)}"
