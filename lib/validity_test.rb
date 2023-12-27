module Validity
    def outside_board(square)
        square.each{|coordinate| return true if coordinate < 0 || coordinate > 7}
        false
    end
end