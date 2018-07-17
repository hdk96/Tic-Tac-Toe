require './board' #appel la classe  grille
require './player' # appel la classe joueur

class Game

  def initialize  # initialisation 
    @board  = Board.new  # Initialisation Grille
    @player = Array.new # Initialisation array
    @player << Player.new << Player.new # rempli cases array
    @turn_idx = 0

    puts "\nPlayer #{@player[0].name_piece} and #{@player[1].name_piece}" # Affichage infos joueurs 
  end

  def play # methode jouer
    @board.show # affiche la grille
    while true # boucle infini
      name = @player[@turn_idx].name  # vaeur nom   
      piece= @player[@turn_idx].piece # valeur piece  

      printf "Place your #{piece}, #{name}: " # formatage chaine
      if @board.place piece, gets.chomp.to_i # converti le num de case
        @board.show # affiche la grille
        case @board.win_or_draw? # verifie si gagne ou bloquer
        when nil # si case num
          @turn_idx = (@turn_idx == 0 ? 1 : 0) 
        when 'D' # Bloquer 
          puts "\nThe game is a draw.\n\n" # affiche Bloquer
          break # Arret
        else
          puts "\n#{name} wins!\n\n" # Dans ce cas gagner
          break #arret
        end
      end
    end
  end

end


Game.new.play # lance la partie