defmodule FIBD do
  def create_first_generation(size) do
    Enum.map(1..size, fn x ->
      case x do
        1 -> 1
        _ -> 0
      end
    end)
  end

  def calc_pop_size(pop) do
    Enum.reduce(pop, fn (x, acc) -> x + acc end)
  end

  def calc_num_children(pop) do
    calc_pop_size(pop |> tl())
  end

  def remove_oldest(pop) do
    pop |> Enum.reverse() |> tl() |> Enum.reverse()
  end

  def calc_next_generation(pop) do
    [calc_num_children(pop) | remove_oldest(pop)]
  end

  def simulate(current, left) do
    if (left <= 0) do
      raise "Invalid number of generations"
    end

    case left do
      1 -> current
      _ -> calc_next_generation(current) |> simulate(left - 1)
    end
  end

  def find_pop_size_at_month(n, m) do
    simulate(create_first_generation(m), n)
  end
end

########
# MAIN #
########

{n, tail} = IO.gets("") |> Integer.parse()
{m, _} = tail |> String.trim() |> Integer.parse()

IO.puts("Analyzing:")
IO.puts(n)
IO.puts(m)

IO.puts("\nResult:")
IO.puts(FIBD.find_pop_size_at_month(n, m) |> FIBD.calc_pop_size())
