defmodule Aoc21.Day2.Submarine do
  defstruct position: 0, depth: 0, aim: 0

  def exec(%__MODULE__{position: position, aim: aim, depth: depth} = sub, {:forward, n}) do
    %{sub | position: position + n, depth: depth + aim * n}
  end

  def exec(%__MODULE__{aim: aim} = sub, {:down, n}) do
    %{sub | aim: aim + n}
  end

  def exec(%__MODULE__{aim: aim} = sub, {:up, n}) do
    %{sub | aim: aim - n}
  end
end
