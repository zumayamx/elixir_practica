                #Funciones simples,
                #José Manuel García Zumaya
                #27-02-24
defmodule Basics do
  def sum(a, b) do
    a + b #Regresa la ultima expresión que tenga dentro de la función
  end

  def temperaturef(celsius) do
    (celsius * 9/5) + 32
  end

  def temperaturec(farenheid) do
    (farenheid - 32) * 5/9
  end
end

IO.puts(Basics.sum(3, 4)) #Los espacios son importantes, ARITY
IO.puts(Basics.temperaturef(100))
IO.puts(Basics.temperaturec(100))

# Pipe operator
# Se utiliza para pasar el resultado de una función a otra función
83.12
|> Basics.temperaturec()
|> Basics.temperaturef()
|> Basics.sum(2) #Cuidar el numero de argumentos que recibe
|> IO.puts()


IO.gets("Dame un número: ")
|> String.trim()
|> String.to_float()
|> Basics.temperaturec()
|> Basics.temperaturef()
|> Basics.sum(2) #Cuidar el numero de argumentos que recibe
|> IO.puts()
