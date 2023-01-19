require "set"

module Part1
    class Rope
        def initialize
            @head = [0,0]
            @tail = [0,0]
            @new_positions = Set[[0,0]]
        end
    
        def up(steps)
            steps.times do
                @head[1] += 1
                unless around?
                    @tail[0] = @head[0]
                    @tail[1] = @head[1] - 1
                    checkTail
                end
            end
        end
    
        def down(steps)
            steps.times do
                @head[1] -= 1
                unless around?
                    @tail[0] = @head[0]
                    @tail[1] = @head[1] + 1
                    checkTail
                end
            end
        end
    
        def right(steps)
            steps.times do
                @head[0] += 1
                unless around?
                    @tail[0] = @head[0] - 1
                    @tail[1] = @head[1]
                    checkTail
                end
            end
        end
    
        def left(steps)
            steps.times do
                @head[0] -= 1
                unless around?
                    @tail[0] = @head[0] + 1
                    @tail[1] = @head[1]
                    checkTail
                end
            end
        end

        def getPositions
            @new_positions.size
        end
    
        private
        def around?
            dx = @head[0] - @tail[0]
            dy = @head[1] - @tail[1]
            dx.abs <= 1 and dy.abs <= 1
        end
    
        def checkTail
            @new_positions.add([@tail[0], @tail[1]])
        end
    end

    def self.run(path)
        rope = Rope.new
        
        File.readlines(path, chomp: true).each do |command|
            dir, steps = command.split
            case dir
                when "U"
                    rope.up steps.to_i
                when "D"
                    rope.down steps.to_i
                when "L"
                    rope.left steps.to_i
                when "R"
                    rope.right steps.to_i
            end
        end
        
        rope.getPositions
    end
end