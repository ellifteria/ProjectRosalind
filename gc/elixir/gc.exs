defmodule FASTAReader do
  defp readFileInput filePath do
    contents = File.read(String.trim(filePath)) |> case do
      {:ok, text} -> text
      {_, errorType} -> raise RuntimeError, message: to_string(errorType)
    end

    contents |>
    String.split("\n")
  end

  defp combineDna [] do
    ""
  end

  defp combineDna lines do
    line = hd lines

    if String.starts_with?(line, ">") do
      "\n" <> line <> "\n" <> combineDna(tl(lines))
    else
      line <> combineDna(tl(lines))
    end
  end

  defp wrapIntoTuples [] do
    []
  end

  defp wrapIntoTuples lines do
    dropPrefix = fn string, prefix ->
      <<_::binary-size(byte_size(prefix)), rest::binary>> = string
      rest
    end

    first = hd lines
    rest = tl lines

    newTuple = {dropPrefix.(first, ">"), hd rest}

    [ newTuple | wrapIntoTuples(tl rest)]
  end

  def readDnaFromFile filePath do
    readFileInput(filePath) |>
    combineDna() |>
    String.trim() |>
    String.split("\n") |>
    wrapIntoTuples()
  end
end

defmodule GC do

  def computeStr dnaStr do
    (
      String.graphemes(dnaStr) |>
      Enum.reduce(0,
        fn(x, acc) ->
          case x do
            "C" -> acc + 1
            "G" -> acc + 1
            _ -> acc
          end
        end)
    ) / String.length(dnaStr) * 100
  end

  def computeTupleList tupleList do
    tupleList |>
    Enum.map(
      fn(dnaTuple) ->
        {elem(dnaTuple, 0), GC.computeStr(elem(dnaTuple, 1))}
      end
    )
  end

  def findHighest tupleList do
    tupleList |>
    Enum.reduce(
      {"", 0},
      fn(dnaTuple, acc) ->
        if elem(dnaTuple, 1) > elem(acc, 1) do
          dnaTuple
        else
          acc
        end
      end
    )
  end
end

##########
#  MAIN  #
##########

result = FASTAReader.readDnaFromFile(IO.gets("")) |>
GC.computeTupleList() |>
GC.findHighest()

IO.puts(elem(x, 0) <> "\n" <> to_string(elem(x, 1)))
