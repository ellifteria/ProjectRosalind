defmodule PRTM do
  def calculate_protein_mass(protein) do
    String.graphemes(protein) |>
    Enum.reduce(
      0,
      fn(x, acc) ->
        acc + case x do
          "A" -> 71.03711
          "C" -> 103.00919
          "D" -> 115.02694
          "E" -> 129.04259
          "F" -> 147.06841
          "G" -> 57.02146
          "H" -> 137.05891
          "I" -> 113.08406
          "K" -> 128.09496
          "L" -> 113.08406
          "M" -> 131.04049
          "N" -> 114.04293
          "P" -> 97.05276
          "Q" -> 128.05858
          "R" -> 156.10111
          "S" -> 87.03203
          "T" -> 101.04768
          "V" -> 99.06841
          "W" -> 186.07931
          "Y" -> 163.06333
          _ -> raise("Invalid protein: " <> x)
        end
      end
    ) |>
    Float.round(3)
  end
end

##########
#  MAIN  #
##########

protein = IO.gets("") |> String.trim()

IO.puts("Analyzing:\n" <> protein)

mass = PRTM.calculate_protein_mass(protein)
IO.puts("\nResult:\n" <> to_string(mass))
