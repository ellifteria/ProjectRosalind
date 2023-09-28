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
