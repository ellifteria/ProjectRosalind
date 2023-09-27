defmodule RNA do
  def convert_to_rna(string) do
    String.graphemes(string) |>
    Enum.map(
      fn(x) ->
        case x do
          "T" -> "U"
          "\n" -> ""
          _ -> x
        end
      end) |>
    Enum.reduce(fn(x, acc) -> acc <> x end)
  end
end

##########
#  MAIN  #
##########

dna_string = IO.gets("")

IO.puts("Analyzing:")
IO.puts(dna_string)

IO.puts("Result:")
IO.puts(RNA.convert_to_rna(dna_string))
