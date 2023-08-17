defmodule HAMM do
  def calculate_hamming_distance(string1, string2) do
    if (String.length(string1) != String.length(string2)) do
      raise "Invalid DNA string lengths"
    end

    Enum.zip(String.graphemes(string1), String.graphemes(string2)) |>
    Enum.reduce(0,
    fn(x, acc) -> if elem(x, 0) != elem(x, 1) do
      acc + 1
    else acc
    end
    end)
  end
end

##########
#  MAIN  #
##########

dna_string1 = IO.gets("")
dna_string2 = IO.gets("")

IO.puts("Analyzing:")
IO.puts(dna_string1)
IO.puts(dna_string2)

IO.puts("\nResult:")
IO.puts(HAMM.calculate_hamming_distance(dna_string1, dna_string2))
