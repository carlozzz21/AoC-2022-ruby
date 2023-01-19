module Part1
    def self.decrypt(hash)
        if hash == 'A' || hash == 'X'
            :rock
        elsif hash == 'B' || hash == 'Y'
            :paper
        else
            :scissors
        end
    end

    def self.run(path)
        score = 0
        shapeScore = 0
        winnerScore = 0
        IO.readlines(path, chomp: true).each do |line|
            round = line.split
            opponent = decrypt(round[0])
            me = decrypt(round[1])
            if opponent == :rock
                if me == :paper
                    winnerScore = 6
                elsif me == :scissors
                    winnerScore = 0
                elsif me == :rock
                    winnerScore = 3
                end
            elsif opponent == :paper
                if me == :paper
                    winnerScore = 3
                elsif me == :scissors
                    winnerScore = 6
                elsif me == :rock
                    winnerScore = 0
                end
            elsif opponent == :scissors
                if me == :paper
                    winnerScore = 0
                elsif me == :scissors
                    winnerScore = 3
                elsif me == :rock
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