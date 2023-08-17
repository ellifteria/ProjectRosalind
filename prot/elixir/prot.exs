defmodule PROT do
  def translate_into_protein(dna_string)  do
    String.graphemes(dna_string) |>
    Enum.chunk_every(3) |>
    Enum.map(&(
      case &1 do
        ["U", "U", t] when t in ["U", "C"] -> "F"
        ["U", "U", t] when t in ["A", "G"] -> "L"
        ["U", "C", _] -> "S"
        ["U", "A", t] when t in ["U", "C"] -> "Y"
        ["U", "A", t] when t in ["A", "G"] -> "Stop"
        ["U", "G", t] when t in ["U", "C"] -> "C"
        ["U", "G", "A"] -> "Stop"
        ["U", "G", "G"] -> "W"
        ["C", "U", _] -> "L"
        ["C", "C", _] -> "P"
        ["C", "A", t] when t in ["U", "C"] -> "H"
        ["C", "A", t] when t in ["A", "G"] -> "Q"
        ["C", "G", _] -> "R"
        ["A", "U", t] when t != "G" -> "I"
        ["A", "U", t] when t == "G" -> "M"
        ["A", "C", _] -> "T"
        ["A", "A", t] when t in ["U", "C"] -> "N"
        ["A", "A", t] when t in ["A", "G"] -> "K"
        ["A", "G", t] when t in ["U", "C"] -> "S"
        ["A", "G", t] when t in ["A", "G"] -> "R"
        ["G", "U", _] -> "V"
        ["G", "C", _] -> "A"
        ["G", "A", t] when t in ["U", "C"] -> "D"
        ["G", "A", t] when t in ["A", "G"] -> "E"
        ["G", "G", _] -> "G"
        _ -> raise("Invalid base: " <> Enum.reduce(&1, fn(x, acc) -> acc <> x end))
      end
    )) |>
    Enum.reduce(fn(x, acc) -> acc <> x end) |>
    String.split("Stop") |>
    hd()
  end
end

##########
#  MAIN  #
##########

dna_string = IO.gets("") |> String.trim()

IO.puts("Analyzing:\n" <> dna_string)

protein = PROT.translate_into_protein(dna_string)
IO.puts("\nResult:\n" <> protein)
