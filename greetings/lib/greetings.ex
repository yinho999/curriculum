defmodule Greetings do
  @moduledoc """
  Documentation for `Greetings`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Greetings.hello()
      :world

  """
  @spec main(list(String.t())) :: :ok
  def main(args) do
    # ./greetings --time="evening"
    {opts, _word, _errors} = OptionParser.parse(args, switches: [time: :string, upcase: :boolean])
    # ./greetings --upcase=true

    time =
      if opts[:upcase] do
        String.upcase(opts[:time])
      else
        opts[:time]
      end

    IO.puts("Good #{time || "morning"}!")
  end
end
