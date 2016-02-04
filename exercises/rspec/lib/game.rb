class Game
  COMBINATIONS = {
    "scissors" => "paper", 
    "rock" => "scissors", 
    "paper" => "rock", 
   }

  def get_user_input
   puts "Please enter rock, paper or scissors"
   make_a_move(gets.chomp)
  end

  def make_a_move(move)
      return "#{move} is not a valid move, your options are rock, paper and scissors" unless check_valid_move?(move)
      "You have selected #{move}"
  end

  def generate_response(move, response)
      return "#{move}:#{response}, tie!" unless move != response
      return "#{move}:#{response}, you win this round!" if COMBINATIONS.keys.include?(move) && COMBINATIONS[move] == response
      "#{move}:#{response}, loooooosseeeerrrrrrrr!"
  end

  def generate_random_move()
    items  = COMBINATIONS.values
    items[rand(items.length)]
  end

  def check_valid_move?(move)
    COMBINATIONS.keys.include?(move)
  end

end