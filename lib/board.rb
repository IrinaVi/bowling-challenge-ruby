class Board
    def initialize
        @total = 0
        @scores = []
        @game_on = true
        @frame = []
        @wrong_input = false
        @strike = false
        @spare = false
    end

    def add_throw(throw_score)
        @total+=throw_score
    end

    def counting_total
        @scores[@scores.length-1].each {|throw| add_throw(throw)}
    end

    def run
        while @game_on
            frame = []
            wrong_input = false
            strike = false
            spare = false
            for i in 1..2 do
                puts "What is the throw score? Score length: #{@scores.length}"
                throw_score = gets.chomp.to_i

                if throw_score > 10 || throw_score < 0
                    puts "Score cannot be higher than 10 or less than 0. Try again."
                    wrong_input = true
                    break
                end

                frame << throw_score
                if throw_score.to_i == 10 && i == 1
                    puts "strike"
                    strike = true
                    break
                elsif i == 2 && frame[0] + frame[1] == 10
                    puts "spare"
                    spare = true
                end

            end

            unless wrong_input

                @scores << frame
                len = @scores.length
                counting_total()

                if len > 1 && @scores[@scores.length-2][0] == 10
                    counting_total()
                elsif len > 1 && (@scores[len-2][0] + @scores[len-2][1]) == 10
                    add_throw(@scores[len-1][0])
                end

            end

            @game_on = false if @scores.length == 10 unless strike || spare
            @game_on = false if @scores.length == 11

            puts "scores: #{@scores}"
            puts "total is #{total_score}"
        end
    end
end

game = Board.new
game.run