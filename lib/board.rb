class Board
    def initialize
        @total = 0
        @frame = 1
        @throw_num = 1
        @frame_score = 0
        @scores = []
        @strike = false
    end

    def add_throw(throw_score)
        @total+=throw_score
    end

    def strike(throw_score)
        throw_score == 10 && @throw_num % 2 == 1
        # returns true if the throw score is 10 which is strike
    end

    def spare(throw_score)
        throw_score == 10 && @throw_num % 2 == 0
    end

    def total_score
        @total
    end

    def run
        while @scores.length < 10
            frame = []
            for i in 1..2 do
                puts "What is the throw score?"
                puts "#{i}"
                throw_score = gets.chomp.to_i
                add_throw(throw_score)
                frame << throw_score
                if throw_score.to_i == 10 && i == 1
                    puts "strike"
                    @strike = true
                    break
                end

            end
            
            @scores << frame
            puts "scores are #{@scores}, frame is #{frame}, total is #{total_score}"
            len = @scores.length
            puts "scores len: #{@scores.length} #{@strike}"

            if @strike
                add_throw(@scores[len-1][0].to_i)
                add_throw(@scores[len-1][1].to_i)
                @strike = false
                puts "#{@scores[len-1][0]}, #{@scores[len-1][1]}"
            end
            puts "total is #{total_score}"
        end
    end
end

game = Board.new
game.run