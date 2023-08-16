defmodule REVC do
  def generate_reverse_complement(string) do
    String.graphemes(string) |>
    Enum.map(
      fn(x) -> case x do
        "A" -> "T"
        "C" -> "G"
        "G" -> "C"
        "T" -> "A"
        "\n" -> ""
        _ -> raise("Invalid base: " <> x)
      end
    end) |>
    Enum.reverse() |>
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
IO.puts(REVC.generate_reverse_complement(dna_string))
