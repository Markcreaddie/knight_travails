require "./lib/validity_test.rb"

class Knight
    include Validity
    attr_accessor :coordinate , :moves , :children

    def initialize(coordinate)
        self.coordinate = coordinate
        self.moves = self.get_moves(coordinate)
    end
    
    def get_moves(coordinate, result=[])
        moves = [[1,2],[-1,2],[1,-2],[-1,-2],[2,1],[-2,1],[2,-1],[-2,-1]]
        moves.each do |move|
            target = [coordinate[0]+move[0],coordinate[1]+move[1]]
            result << target unless outside_board(target)
        end
        return result
    end
end
