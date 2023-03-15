# fronzen-string-literal: true

require_relative 'knight'

# A class for a knight piece in a chess game
class Board

  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-2, 1], [-1, 2], [-2, -1], [-1, -2]].freeze

  def initialize; end

  def knight_moves(pos, dest)
    dest = find_path(pos, dest)
    history = get_history(pos, dest)
    puts "You made it in #{history.length - 1} move(s)! here's your path:"
    history.each { |move| p move }
  end

  private

  def find_path(pos, dest)
    queue = [Knight.new(pos)]
    current = queue.shift
    until current.position == dest
      moves = possible_moves(current.position)
      moves.each { |move| queue << Knight.new(move, current) }
      current = queue.shift
    end
    current
  end

  def possible_moves(position, res = [])
    MOVES.each do |move|
      dest = [position[0] + move[0], position[1] + move[1]]
      res << dest if vaild_move?(dest)
    end
    res
  end

  def vaild_move?(dest)
    return true if dest[0].between?(0, 7) && dest[1].between?(0, 7)

    false
  end

  def get_history(pos, dest, path = [])
    until dest.position == pos
      path << dest.position
      dest = dest.parent
    end
    path << dest.position
    path.reverse
  end
end
