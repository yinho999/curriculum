defmodule Games.RockPaperScissors do
  @moduledoc """
  A module for a rock paper scissors game.
  """

  @type choice :: :rock | :paper | :scissors

  def random_choice() do
    Enum.random([:rock, :paper, :scissors])
  end

  def win(player_choice, computer_choice)
      when is_atom(player_choice) and is_atom(computer_choice) do
    cond do
      player_choice === :rock and computer_choice === :scissors -> :win
      player_choice === :paper and computer_choice === :rock -> :win
      player_choice === :scissors and computer_choice === :paper -> :win
      player_choice == computer_choice -> :tie
      true -> :lose
    end
  end

  def play() do
    IO.puts("Rock, Paper, Scissors")

    player_choice =
      IO.gets("Enter your choice (rock/paper/scissors): ")
      |> String.trim()
      |> String.downcase()
      |> String.to_atom()

    computer_choice = random_choice()

    case win(player_choice, computer_choice) do
      :win -> IO.puts("You win! #{player_choice} beats #{computer_choice}")
      :lose -> IO.puts("You lose! #{computer_choice} beats #{player_choice}")
      :tie -> IO.puts("It's a tie! #{player_choice} = #{computer_choice}")
    end
  end
end
