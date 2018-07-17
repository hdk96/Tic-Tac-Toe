class Board
  #
  #  1 | 2 | 3    Win Rows: [1,2,3],[4,5,6],[7,8,9]
  # ---+---+---
  #  4 | 5 | 6    Win Cols: [1,4,7],[2,5,8],[3,6,9]
  # ---+---+---
  #  7 | 8 | 9    Win Diag: [1,5,9],[3,5,7]
 
  Winners= [[1,2,3],[4,5,6],[7,8,9], # Combinaison sur Ligne
            [1,4,7],[2,5,8],[3,6,9], # Combinaison sur Colone 
            [1,5,9],[3,5,7]]         # Combinaison sur Diagonale

  def initialize
    reset # Debut
  end

  def reset
     
    @cells    = Array.new(10,' ') # creation avec taille array
    @cells[0] = '*'  #case a bloquer
  end

  def place piece, cell #definition positon case
    if cell < 1 || cell > 9 #verifie respet taille
      puts 'Sorry, choice must be in the range from 1 to 9 - try again!'
    elsif @cells[cell] != ' ' # case non libre
      puts 'Sorry, that spot is already occupied - try again!'
    elsif piece.scan(/[xo]/i).empty? # verifie saisies
      puts 'Sorry, I only accept X\'s and O\'s - try again!'
    else
      @cells[cell] = piece.upcase # convertie tout en majuscule
      return true
    end
    false
  end

  def show # definition affichage
      
    puts <<-EOB # affichage grille
     1 | 2 | 3      #{@cells[1]} | #{@cells[2]} | #{@cells[3]}
    ---+---+---    ---+---+---
     4 | 5 | 6      #{@cells[4]} | #{@cells[5]} | #{@cells[6]} 
    ---+---+---    ---+---+---
     7 | 8 | 9      #{@cells[7]} | #{@cells[8]} | #{@cells[9]}
    EOB
  end

  def win_or_draw? # methode verifie gagne ou perd
    return 'X' if check_for_win 'X' # retourne Si X gagnant
    return 'O' if check_for_win 'O' # retourne Si O gagnant
    return 'D' if @cells.none? {|c| c == ' '}  # Si bloquer
  end

  private 
  def check_for_win piece # verification winner
    Winners.each do |win| #parcours grille 
      return true if win.select{|i| @cells[i] == piece}.count == 3   # retourne resultat
    end
    false
  end

end