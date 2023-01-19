require 'set'

module Part2
    class Rope
        MOVE = {
            "U" => [0,1],
            "D" => [0,-1],
            "R" => [1,0],
            "L" => [-1,0]
        }

        def initialize(num)
            @rope = Array.new(num) {[0,0]}
            @new_positions = Set[[0,0]]
        end

        def move_rope(dir, steps)
            steps.times do
                mx, my = MOVE[dir]
                
                @rope[0][0] += mx
                @rope[0][1] += my

                for i in 1..@rope.length-1
                    tx, ty = calculate_moves(@rope[i], @rope[i-1])
                    @rope[i][0] += tx
                    @rope[i][1] += ty
                end

                @new_positions.add([@rope[-1][0],@rope[-1][1]])
            end
        end
      
        def getPositions
            @new_positions.size
        end
      
        private
        def calculate_moves(tail,head)
            dx = head[0] - tail[0]
            dy = head[1] - tail[1]
            mx = 0
            my = 0

            if dx.abs <= 1 and dy.abs <= 1
                return [mx, my]
            elsif dx == 0
                if dy > 0
                    my = 1
                else
                    my = -1
                end
            elsif dy == 0
                if dx > 0
                    mx = 1
                else
                    mx = -1
                end
            else 
                if dx > 0
                    mx = 1
                else
                    mx = -1
                end 
        
                if dy > 0
                    my = 1
                else 
                    my = -1
                end
            end

            [mx, my]
        end
    end

    def self.run(path)
        rope = Rope.new(10)

        File.readlines(path, chomp: true).each do |command|
            dir, steps = command.split
            rope.move_rope(dir, steps.to_i)
        end
        
        rope.getPositions
    end
end