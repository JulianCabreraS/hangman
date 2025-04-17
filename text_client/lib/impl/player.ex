defmodule TextClient.Impl.Player do
  @typep game :: Hangman.game()
  @typep tally :: Hangman.tally()
  @typep state :: {game, tally}

  @spec start() :: :ok
  def start() do
    game = Hangman.new_game()
    tally = Hangman.tally(game)
    interact({game, tally})
  end

  @spec interact(state) :: :ok

  def interact({_game, _tally = %{game_state: :won}}) do
    IO.puts("Congratulations! You won!")
  end

  def interact({_game, tally = %{game_state: :lost}}) do
    IO.puts("Sorry, you lost..the word was #{tally.letters |> Enum.join()}")
  end

  def interact({_game, tally}) do
    # feedback
    IO.puts(feedback_for(tally))
    # display current word
    # get next guess
    # make move
  end

  # @type state :: :initializing | :won | :lost | :good_guess | :bad_guess | :already_used
  def feedback_for(tally = %{game_state: :initializing}) do
    "Welcome! I am thinking of a #{tally.letters |> length()} letter word."
  end

  def feedback_for(%{game_state: :already_used}) do
    "You already used that letter. Try again."
  end

  def feedback_for(%{game_state: :good_guess}) do
    "Good guess!"
  end

  def feedback_for(%{game_state: :bad_guess}) do
    "That letter is not in the word. Try again."
  end
end
