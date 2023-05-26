class Board
  attr_accessor :cups, :non_store_cups, :player1, :player2

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new([])}
    @player1 = name1
    @player2 = name2
    @non_store_cups = cups[0..5] + cups[7..12]
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    non_store_cups.each do |cup|
      4.times {cup << :stone}
    end 
  end

  def valid_move?(start_pos)
      if cups[start_pos] == nil 
        raise "Invalid starting cup"
      elsif cups[start_pos].length == 0 
        raise "Starting cup is empty"
      end 
  end

  def make_move(start_pos, current_player_name)
      stone_count = cups[start_pos].length
      cups[start_pos] = []
      if current_player_name == player1 
          i = (start_pos + 1) % 13
          while stone_count > 0
            unless i == 13 
              cups[i] << :stone
              stone_count -= 1
              ending_cup_idx = i if stone_count == 0 
              i = ((i + 1) % 13)
            end 
          end 
      else 
        i = (start_pos + 1) % 13
          while stone_count > 0 
            unless i == 6
              cups[i] << :stone
              stone_count -= 1
              i = ((i + 1) % 13)
            end 
          end 
      end 
      self.render
      next_turn(ending_cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if cups[ending_cup_idx].length == 0
      return :switch
    elsif (ending_cup_idx == 6) || (ending_cup_idx == 0)
      return :prompt
    else
      return ending_cup_idx
    end 
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if (cups[0..5].all? { |cup| cup.empty?}) || (cups[7..12].all? { |cup| cup.empty?})
    false
  end

  def winner
    if cups[6].length == cups[13].length 
      return :draw
    elsif cups[6].length > cups[13].length
      return player1 
    else
      return player2
    end 
  end
end