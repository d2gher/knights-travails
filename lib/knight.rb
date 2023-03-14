# fronzen-string-literal: true

# A class for a knight piece in a chess game
class Knight
  attr_reader :position, :parent
  attr_accessor :children

  def initialize(position, parent = nil)
    @position = position
    @children = []
    @parent = parent
  end
end
