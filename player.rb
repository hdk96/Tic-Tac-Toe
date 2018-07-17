class Player

  
  @@player_number = 0 # initialisation 

  attr_reader :name  # acces nom
  attr_reader :piece # acces piece

  def initialize 
    @@player_number += 1 # incrementation numero joueur
    setup # appel methode setup
  end

  def setup # definition setup
    printf "Enter player #{@@player_number}'s name: " # affichage infos
    @name  = gets.chomp.capitalize # affectation a name
    @piece = @@player_number % 2 == 1 ? 'X':'O' # affectation a piece
  end

  def name_piece  # affichage nom et piece
    "#{name} is #{piece}'s"
  end
end

