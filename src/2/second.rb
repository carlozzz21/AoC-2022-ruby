module Part2
    def self.decryptShape(hash)
        if hash == "A"
            return :rock
        elsif hash == "B"
            return :paper
        else
            return :scissors
        end
    end

    def self.decryptRound(hash)
        if hash == "X"
            return :lose
        elsif hash == "Y"
            return :draw
        else
            return :win
        end
    end

    def self.run(path)
        score = 0
        shapeScore = 0
        winnerScore = 0
        IO.readlines(path, chomp: true).each do |line|
            row = line.split
            opponent = decryptShape(row[0])
            me = nil
            round = decryptRound(row[1])
            if opponent == :rock 
                if round == :win
                    me = :paper
                    winnerScore = 6
                elsif round == :lose
                    me = :scissors
                    winnerScore = 0
                elsif round == :draw
                    me = :rock
                    winnerScore = 3
                end
            elsif opponent == :paper
                if round == :draw
                    me = :paper
                    winnerScore = 3
                elsif round == :win
                    me = :scissors
                    winnerScore = 6
                elsif round == :lose
                    me = :rock
                    winnerScore = 0
                end
            elsif opponent == :scissors
                if round == :lose
                    me = :paper
                    winnerScore = 0
                elsif round == :draw
                    me = :scissors
                    winnerScore = 3
                elsif round == :win
                    me = :rock
                    winnerScore = 6
                end
            end
            if me == :rock
                shapeScore = 1
            elsif me == :paper
                shapeScore = 2
            elsif me == :scissors
                shapeScore = 3
            end
            score += shapeScore + winnerScore
          end
          score
    end
end