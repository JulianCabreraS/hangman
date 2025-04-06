defmodule Hangman do
  @type game :: any
  @type tally :: %{
          turns_left: integer,
          game_state: atom,
          letters: list(String.t()),
          used: list(String.t())
        }

  @spec new_game :: game
  def new_game do
  end

  @spec make_move(game, String.t()) :: {game, tally}
  def make_move(game, guess) do
  end
end
