# Basic implementation of Finite Automatons
# An Automaton is defined as:
# M = (Q, Σ, δ, q0, F)
# José Manuel Garíca Zumaya A01784238
# 16 - 04 - 2024

defmodule DFA do

  # The automata argument is expressed as:
  # {delta, accept, q0}
  def evaluate(string, automata) do
    string
    |> String.graphemes() # Split the string into characters
    |> eval_dfa(automata)
  end

  def eval_dfa([], {_delta, accept, state}) do
    Enum.member?(accept, state) # Check if the final state is in the accept states, si a lista de estados de aceptacion contiene a state
  end

  def eval_dfa([char | tail], {delta, accept, state}) do
    binding() |> IO.inspect()
    new_state = delta.(state, char) # de la funcion delta, se le pasa el estado actual y el caracter actual, delta es el parametro y el "nuevo nombre" con el cual podemos acceder
    #dentro de la funcion eval_dfa
    eval_dfa(tail, {delta, accept, new_state})
  end

  def delta_contains_db(state, char) do
    case state do
      :q0 -> case char do
        "a" -> :q3
        "b" -> :q0
        "c" -> :q0
        "d" -> :q1
      end
      :q1 -> case char do
        "a" -> :q3
        "b" -> :q2
        "c" -> :q0
        "d" -> :q1
      end
      :q2 -> case char do
        "a" -> :q4
        "b" -> :q2
        "c" -> :q2
        "d" -> :q2
      end
      :q3 -> case char do
        "a" -> :q3
        "b" -> :q0
        "c" -> :q0
        "d" -> :q5
      end
      :q4 -> case char do
        "a" -> :q4
        "b" -> :q2
        "c" -> :q2
        "d" -> :q5
      end
      :q5 -> case char do
        "a" -> :q5
        "b" -> :q5
        "c" -> :q5
        "d" -> :q5
      end
    end
  end

  def delta_int_arithmetic(state, char) do
    case state do
      :start -> cond do
        is_sing(char) -> :sing
        is_digit(char) -> :int
        true -> :error
      end

      :int -> cond do
        is_digit(char) -> :int
        is_operator(char) -> :op
        char == "." -> :dot
        true -> :error
      end

      :dot -> cond do
        is_digit(char) -> :indot
        true -> :error
      end

      :indot -> cond do
        is_digit(char) -> :indot
        is_operator(char) -> :op
        true -> :error
      end

      :op -> cond do
        is_digit(char) -> :int
        is_sing(char) -> :sing
        true -> :error
      end

      :sing -> cond do
        is_digit(char) -> :int
        true -> :error
      end

      :error -> :error
    end
  end

  def is_digit(char) do
    "0123456789" |> String.graphemes()
    |> Enum.member?(char)
  end

  def is_sing(char) do
    Enum.member?(["+", "-"], char)
  end

  def is_operator(char) do
    Enum.member?(["+", "-", "*", "/", "%"], char)
  end

end

auto_arithmetic = {&DFA.delta_int_arithmetic/2, [:int, :indot], :start}

IO.inspect(DFA.evaluate("acdbab",{&DFA.delta_contains_db/2, [:q2, :q4], :q0}))
IO.inspect(DFA.evaluate("-33.7", auto_arithmetic))

#& Capture operator to pass the function as an argument, that exist
# The entire name of a variable include the number of arguments that the function receives
