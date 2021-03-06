require_relative 'Piece.rb'

class Board
  attr_accessor :grid
  
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end
  
  def populate
    @grid.each_with_index do |row, idx|
      row.each_index do |idx2|
        @grid[idx][idx2] = Piece.new if idx < 2 || idx > 5
      end
    end
  end
  
  def move_piece(start_pos, end_pos)
      x1, y1 = start_pos
      x2, y2 = end_pos
      if valid_move?(start_pos, end_pos)
        piece = @grid[x1][y1]
        @grid[x1][y1] = nil 
        @grid[x2][y2] = piece
      end
    end
  end
  
  def valid_move?(start_pos, end_pos)
    begin
      raise PieceError if empty_pos?(start_pos)  
      raise PositionError unless valid_pos?(end_pos)
      raise MoveError unless empty_pos?(end_pos)
    rescue PositionError
      puts "End position is not valid; enter a valid position eg 0,1"
      end_pos = parse(gets.chomp)
      retry
    rescue MoveError
      puts "End position is occupied; enter a valid position eg 0,1"
      end_pos = parse(gets.chomp)
      retry
    rescue PieceError
      puts "There is no piece at that position; enter a valid start position"
      start_pos = parse(gets.chomp)
      retry
  end
  
  def valid_pos?(pos)
    x, y = pos
    x > 0 && x < 8 && y > 0 && y < 8
  end
  
  def empty_pos?(pos)
    x, y = pos
    if valid_pos?(pos)
      @grid[x][y] == nil 
    end
  end
  
  def parse(position)
    [position[0].to_i, position[-1].to_i]
  end
  
  def [](pos)
    x, y = pos
    @grid[x][y]
  end
  
  def []=(pos, value)
    x, y = pos
    @grid[x][y] = value
  end
  
end

class PositionError < StandardError; end
class MoveError <StandardError; end
class PieceError < StandardError; end