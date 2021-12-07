defmodule Mix.Tasks.Aoc21.One do
  use Mix.Task

  def count_increasing(enumerable) do
    enumerable
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.count(fn [d0, d1] -> d1 > d0 end)
  end

  def count_increasing_three_sum(enumerable) do
    enumerable
    |> Stream.chunk_every(3, 1, :discard)
    |> Stream.map(&Enum.sum/1)
    |> count_increasing()
  end

  def get_input(filepath) do
    filepath
    |> File.stream!()
    |> Stream.map(&String.trim/1)
    |> Stream.map(fn x -> Integer.parse(x) |> elem(0) end)
  end

  def run([]), do: run(['priv/input/01/input.txt'])
  def run([filepath]) do
    input = get_input(filepath)

    input
    |> count_increasing()
    |> IO.puts()

    input
    |> count_increasing_three_sum()
    |> IO.puts()
  end
end
