defmodule DNA do
  def count_nucleotide(string, nucleotide) do
    Enum.reduce(String.graphemes(string), 0, fn(c, acc) -> if (c == nucleotide) do acc + 1 else acc end end)
  end

  def count_all_nucleotides(string) do
    Enum.map(["A", "C", "G", "T"], &(count_nucleotide(string, &1)))
  end
end

##########
#  MAIN  #
##########

dna_string = IO.gets("")

IO.puts("Analyzing:")
IO.puts(dna_string)

nucleotide_counts = DNA.count_all_nucleotides(dna_string)

IO.puts("\nResults:\nA C G T:")
IO.puts(Enum.reduce(nucleotide_counts, fn(x, acc) -> to_string(acc) <> " " <> to_string(x) end))
