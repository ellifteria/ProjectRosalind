defmodule FIBO do
  def fibo(n) do
    case n do
      0 -> n
      1 -> n
      _ -> fibo(n - 1) + fibo(n - 2)
    end
  end
end

##########
#  MAIN  #
##########

{n, _} = IO.gets("") |> Integer.parse



IO.puts("Analyzing:")
IO.puts(n)

IO.puts("\nResults:")
IO.puts(FIBO.fibo(n))
