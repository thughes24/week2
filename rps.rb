RPS = {"r" => "Rock", "p" => "Paper", "s" => "Scissors"}

class Moves
  def initialize
    puts "Welcome to Rock Paper Scissors!"
  end
  def user
    begin
    puts "What would you like to go? (r/p/s)"
    @player = gets.chomp.downcase
    end until @player == "r" || @player == "p" || @player =="s"
    puts "You Went #{RPS[@player]}"
    @player
  end

  def comp
    @computer = ["r","p","s"].sample
    puts "Computer Went #{RPS[@computer]}"
    return @computer
  end
end

class WinLogic 
  attr_accessor :player, :computer
  def initialize(player,computer)
    @player = player
    @computer = computer
  end

  def logic
    return "tie" if player == computer
    case player
    when "r" then computer == "s" ? "win" : "lose"
    when "p" then computer == "r" ? "win" : "lose"
    when "s" then computer == "p" ? "win" : "lose"
    end
  end

  def result_message
    case logic
    when "win" then "#{RPS[player]} beats #{RPS[computer]}, You Win!"
    when "lose" then "#{RPS[computer]} beats #{RPS[player]}, You Lose!"
    when "tie" then "#{RPS[player]} draws with #{RPS[computer]}, You Tie!"
    end
  end
end

class GameEngine
  def initialize
    @moves = Moves.new
  end

  def run
    win_lose = WinLogic.new(@moves.user,@moves.comp)
    puts win_lose.result_message
  end

  def play_again?
    begin
    puts "Do you want to play again? (y/n)"
    @play_again = gets.chomp.downcase
    end until @play_again == "y" || @play_again == "n"
    puts "Thank you for playing!"
    @play_again
  end
end

begin
new_game = GameEngine.new
new_game.run
end until new_game.play_again? == "n"
