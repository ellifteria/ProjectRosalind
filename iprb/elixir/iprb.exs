defmodule IPRB do
  def calc_gc(k, m, n) do
    p = k + m + n
    1 - (m/p * ((m-1)/(p-1) * (1/2*1/2) + n/(p-1) * 1/2) + n/p * (m/(p-1) * 1/2 + (n-1)/(p-1)))
  end
end


########
# MAIN #
########

{k, tail} = IO.gets("") |> Integer.parse()
{m, tail} = tail |> String.trim() |> Integer.parse()
{n, _} = tail |> String.trim() |> Integer.parse()

IO.puts("Analyzing:")
IO.puts(k)
IO.puts(m)
IO.puts(n)

IO.puts("\nResult:")
IO.puts(IPRB.calc_gc(k, m, n))
