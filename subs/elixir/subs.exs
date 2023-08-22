defmodule SUBS do
  def find_motif(dna_string, motif) do
    motif_bases = motif |>
    String.trim() |>
    String.graphemes()

    motif_length = motif_bases |>length()

    windows = dna_string |>
    String.trim() |>
    String.graphemes() |>
    Enum.chunk_every(motif_length, 1, :discard)

    Enum.zip(1..length(windows), windows) |>
    Enum.reduce("", fn (x, acc) ->
      if elem(x, 1) == motif_bases do
        acc <> to_string(elem(x, 0)) <> " "
      else
        acc
      end
    end) |>
    String.trim
  end
end

##########
#  MAIN  #
##########

dna_string = IO.gets("")
motif = IO.gets("")

IO.puts("Analyzing:")
IO.puts(dna_string)
IO.puts(motif)

IO.puts("Result:")
IO.puts(SUBS.find_motif(dna_string, motif))
