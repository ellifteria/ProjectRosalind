defmodule IEV do
  def calc_eo(a, b, c, d, e) do
    (a*1+b*1+c*1+d*0.75+e*0.5) * 2
  end
end

########
# MAIN #
########

{a, tail} = IO.gets("") |> String.trim() |> Integer.parse()
{b, tail} = tail |> String.trim() |> Integer.parse()
{c, tail} = tail |> String.trim() |> Integer.parse()
{d, tail} = tail |> String.trim() |> Integer.parse()
{e, tail} = tail |> String.trim() |> Integer.parse()
{f, _} = tail |> String.trim() |> Integer.parse()

IO.puts("Analyzing:")
IO.puts(a)
IO.puts(b)
IO.puts(c)
IO.puts(d)
IO.puts(e)
IO.puts(f)

IO.puts("\nResult:")
IO.puts(IEV.calc_eo(a, b, c, d, e))
