defmodule Mix.Tasks.Aoc21.Two do
  alias Aoc21.Day2.Submarine
  alias Aoc21.Day2.Instruction

  use Mix.Task

  def run([]), do: run(['priv/input/02/01.txt'])

  def run([input_filename]) do
    instructions =
      input_filename
      |> File.stream!()
      |> Stream.map(&String.trim/1)
      |> Stream.map(&Instruction.parse!/1)

    result =
      Enum.reduce(instructions, %Submarine{}, fn instruction, sub ->
        Submarine.exec(sub, instruction)
      end)

    IO.inspect(result)
    IO.puts(result.position * result.depth)
  end
end
