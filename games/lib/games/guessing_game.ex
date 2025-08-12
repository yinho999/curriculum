defmodule Games.GuessingGame do
  @moduledoc """
  A module for a guessing game.
  """

  def generate_random_number(min, max) do
    Enum.random(min..max)
  end

  @doc """
  Guess the number.

  ## Examples

    iex> Games.GuessingGame.guess_number(10)
    You guessed the number!
    :ok
  """
  def guess_number(random_number, attempts \\ 3)

  def guess_number(random_number, attempts)
      when is_integer(random_number) and attempts > 0 do
    guess = IO.gets("Enter your guess: ") |> String.trim() |> String.to_integer()

    cond do
      guess == random_number ->
        IO.puts("Correct guess!")

      guess < random_number ->
        IO.puts("Too low!")
        guess_number(random_number, attempts - 1)

      guess > random_number ->
        IO.puts("Too high!")
        guess_number(random_number, attempts - 1)
    end
  end

  def guess_number(random_number, 0) when is_integer(random_number) do
    IO.puts("You lost! The number was #{random_number}")
    :ok
  end

  @doc """
  Play the guessing game.
  """
  def play do
    min = 1
    max = 10
    random_number = generate_random_number(min, max)
    IO.puts("Guess a number between #{min} and #{max}")

    guess_number(random_number)
  end
end
