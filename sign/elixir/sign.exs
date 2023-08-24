defmodule SIGN do
  def generate_permutations(list) do
    case list do
      [] -> [[]]
      _ -> for x <- list, y <- generate_permutations(list -- [x]), do: [x|y]
    end ++
    case list do
      [] -> [[]]
      _ -> for x <- list, y <- generate_permutations(list -- [x]), do: [-x|y]
    end |>
    Enum.uniq()
  end

  def generate_string(list) do
    list |>
    Enum.reduce("", fn(x, acc) -> acc <> String.trim(Enum.reduce(x, fn(x2, acc2) -> to_string(acc2) <> " " <> to_string(x2) end)) <> "\n" end) |>
    String.trim()
  end
end

##########
#  MAIN  #
##########

{n, _} = IO.gets("") |> String.trim() |> Integer.parse()

IO.puts("Analyzing:\n" <> to_string(n))

permutations = SIGN.generate_permutations(
  Enum.reduce(1..n, [], &([&1 | &2])) |> Enum.reverse()
)

IO.puts("\nResult:\n" <>
to_string(permutations |> length()) <>
"\n" <>
SIGN.generate_string(permutations))
