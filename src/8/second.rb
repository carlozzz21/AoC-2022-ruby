module Part2
    class Grid
        attr_reader :height, :width
        def initialize(path)
            @grid = [[]]
            row = 0
            File.read(path).each_char do |c|
                if c == "\n"
                    @grid.push([])
                    row += 1
                else
                    @grid[row].push(c.to_i)
                end
            end
            @height = @grid.length
            @width = @grid[0].length
        end
        
        def up(i, j)
            y = i - 1
            trees = 0
            while y >= 0
                trees += 1
                if @grid[i][j] <= @grid[y][j]
                    break
                end
                y -= 1
            end
            return trees
        end
        
        def right(i, j)
            x = j + 1
            trees = 0
            while x <= @grid[0].length-1
                trees += 1
                if @grid[i][j] <= @grid[i][x]
                    break
                end
                x += 1
            end
            return trees
        end
        
        def down(i, j)
            y = i + 1
            trees = 0
            while y <= @grid.length-1
                trees += 1
                if @grid[i][j] <= @grid[y][j]
                    break
                end
                y += 1
            end
            return trees
        end
            
        def left(i, j)
            x = j - 1
            trees = 0
            while x >= 0
                trees += 1
                if @grid[i][j] <= @grid[i][x]
                    break
                end
                x -= 1
            end
            return trees
        end
    end

    def self.run(path)
        grid = Grid.new(path)
          
        scenicScore = 0
          
        for i in 1..grid.height-2
            for j in 1..grid.width-2
                newScore = grid.up(i,j) * grid.down(i,j) * grid.right(i,j) * grid.left(i,j)
                scenicScore = newScore if newScore > scenicScore
            end
        end
          
        scenicScore
    end
end