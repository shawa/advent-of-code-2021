defmodule Aoc21.Day2.Instruction do
  def parse!("forward " <> distance_str), do: {:forward, parse_int!(distance_str)}
  def parse!("down " <> distance_str), do: {:down, parse_int!(distance_str)}
  def parse!("up " <> distance_str), do: {:up, parse_int!(distance_str)}

  defp parse_int!(int_str) do
    {n, _remainder_unparsed} = Integer.parse(int_str)
    n
  end
end
