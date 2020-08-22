require_relative "Board.rb"
require_relative "Card.rb"

class Game
    def initialize
        @board = Board.new
        @guesses = []
    end

    def get_position
        print
        puts "Please enter the position of the card you'd like to flip (e.g. '2,3')"
        good_pos = false
        while !good_pos
            pos = gets.chomp.split(",").map(&:to_i)
            if @board.valid_pos?(pos) && @board.already_guessed?(pos) == false
                return pos
            else
                print
                puts "Enter a valid position. (Eg. 0,1)"
            end
        end
    end

    def place_guess(pos)
        @board.reveal(pos)
        @guesses << pos
    end

    def print
        system("clear")
        @board.render
    end

    def play_round
        pos1 = get_position
        place_guess(pos1)
        print
        pos2 = get_position
        place_guess(pos2)
        print
    end

    def matching?
        if get_card(@guesses.first) == get_card(@guesses.last)
            
            return true
        else
            
            return false
        end
    end

    def play
        done = false
        while !done
            @guesses = []
            play_round
            if !matching?
                puts "Try again."
                sleep(2)
                @guesses.each do |card_pos|
                    x,y = card_pos
                    @board.grid[x][y].hide
                    print
                end
            else
                puts "It's a match!"
                sleep(2)
            end
            done = true if @board.won?
        end
        puts "You won!"
    end

    def get_card(pos)
        @board.get_card(pos)
    end 
end

if $PROGRAM_NAME == __FILE__
  game = Game.new
  game.play
end