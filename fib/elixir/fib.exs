defmodule FIB do
  def calc_next_generation(current, k) do
    {elem(current, 0) + elem(current, 1), k * elem(current, 0)}
  end

  def calc_generations(current, k, left) do
    if (left <= 0) do
      raise "Invalid number of generations"
    end

    case left do
      1 -> current
      _ -> calc_next_generation(current, k) |>
            calc_generations(k, left - 1)
    end
  end

  def calc_pop_size(pop) do
    elem(pop, 0) + elem(pop, 1)
  end
end

########
# MAIN #
########

{n, tail} = IO.gets("") |> Integer.parse()
{k, _} = tail |> String.trim() |> Integer.parse()

IO.puts("Analyzing:")
IO.puts(n)
IO.puts(k)

IO.puts("\nResult:")
IO.puts(FIB.calc_generations({0, 1}, k, n) |> FIB.calc_pop_size())
