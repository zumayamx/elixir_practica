#Funciones simples,
#José Manuel García Zumaya
#27-02-24

defmodule Dates do
  def leap?(year) do
    rem(year, 4) == 0 and (rem(year, 100) != 0 or rem(year, 400) == 0)
  end

  def month_days(month, year) do
    cond do
      month == 2 -> if leap?(year), do: 29, else: 28
      month in [4, 6, 9, 11] -> 30
      true -> 31
    end
  end

  def next_day(day, month, year) do
    if day == month_days(month, year) do
       if month == 12 do
         {1, 1, year + 1}
        else
          {1, month + 1, year}
       end
    else
      {day + 1, month, year}
      end
    end
  end

IO.puts(inspect(Dates.month_days(2, 2016)))
IO.puts(inspect(Dates.next_day(28, 2, 2016)))
