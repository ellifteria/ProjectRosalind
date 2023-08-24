defmodule LEXF do
  defp permute(list, n) do
    case {list, n} do
      {_, 0} -> [[]]
      {[], _} -> [[]]
      _ -> for x <- list, y <- permute(list, n - 1), do: [x|y]
    end
  end

  def enumerate_k_mers(alphabet, n) do
    alphabet |>
    String.trim() |>
    String.graphemes() |>
    Enum.reduce([], &(if &1 == " " do &2 else [&1 | &2] end)) |>
    Enum.reverse() |>
    permute(n) |>
    Enum.reduce("", fn(x, acc) -> acc <> Enum.reduce(x, fn(x2, acc2) -> acc2 <> x2 end) <> "\n" end) |>
    String.trim()
  end
end

##########
#  MAIN  #
##########

alphabet = IO.gets("") |> String.trim()
{n, _} = IO.gets("") |> String.trim() |> Integer.parse()

IO.puts("Analyzing:\n" <> alphabet <> "\n" <> to_string(n))

IO.puts("\nResult:\n" <> LEXF.enumerate_k_mers(alphabet, n))
