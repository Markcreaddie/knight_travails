require "./lib/validity_test.rb"
require "./lib/knight.rb"
class Board
    include Validity
    attr_accessor :first , :last , :min_steps
    def initialize()
        self.first = nil
        self.last = nil
        self.min_steps = nil
    end

    def knight_moves(first,last)
        self.first = first
        self.last = last
        paths = []
        [first, last].each  do |square| 
            return "#{square} is outside the board" if outside_board(square)
        end
        get_path do |square, result, steps|
            if square == last
                self.min_steps = steps
                paths = self.retain_shortest_paths(paths , steps)
                paths << result
            end
        end
        return paths
    end

    def get_path(first = self.first, last = self.last, result = [], steps = 0, &my_block)
        return if result.include?(first)
        result << first
        return if self.min_steps != nil && steps > self.min_steps
        if block_given?
            my_block.call(first , result, steps)
        end
        return if first == last
        knight = Knight.new(first)
        knight.moves.each do |move|
            get_path(move , last , result[0..result.length] , steps+1, &my_block)
        end
        
        return 
    end

    def retain_shortest_paths(array,steps)
        return array if array.size == 0
        new_array = []
        array.each do |sub_array|
            if sub_array.size == (steps + 1)
                new_array << sub_array
            end
        end
        new_array
    end
end
