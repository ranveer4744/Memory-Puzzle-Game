require_relative "Card.rb"
class Board
    attr_accessor :grid
    def initialize
        @grid = Array.new(4) {Array.new(4)}
        populate
    end

    def populate
        card_array = (:A..:H).to_a
        shuffled_pairs = (card_array * 2).shuffle
        @grid.each do |row|
            i = 0
            while i < row.length
                row[i] = Card.new(shuffled_pairs.shift)
                i += 1
            end
        end
    end

    def render
        header = [" ",0,1,2,3].join(" ")
        puts header
        vert_header = 0
        @grid.each do |row|
            str = []
            row.each do |card_obj|
                if card_obj.face_up
                    str << card_obj.value
                else
                    str << " "
                end
            end
            puts vert_header.to_s + " "+ str.join(" ")
            vert_header += 1
        end
    end

    def won?
        flat_grid = @grid.flatten
        return false if flat_grid.any? {|card_obj| card_obj.face_up == false}
        true
    end

    def reveal(pos)
        x,y = pos
        if valid_pos?(pos) && already_guessed?(pos) == false
            card = @grid[x][y]
            card.reveal
        else
            puts "Enter a valid position that isn't already revealed. Eg (0,2)"
        end
    end

    def valid_pos?(pos)
        x,y = pos
        begin
            return false if pos.length != 2 || x > 3 || y > 3
            true
        rescue
            false
        end 
    end

    def already_guessed?(pos)
        x,y = pos
        card = @grid[x][y]
        return true if card.face_up
        false
    end

    def get_card(pos)
        x,y = pos
        card = @grid[x][y]
        card.value
    end
end