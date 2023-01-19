module Part1
    def self.isVisible(grid,i, j)
        y = i - 1
        while y >= 0 do
            if grid[i][j] <= grid[y][j]
                break
            end
            if y == 0
                return true
            end
            y -= 1
        end

        x = j + 1
        while x <= grid[0].length-1 do
            if grid[i][j] <= grid[i][x]
                break
            end
            if x == grid[0].length-1
                return true
            end
            x += 1
        end

        y = i + 1
        while y <= grid.length-1
            if grid[i][j] <= grid[y][j]
                break
            end
            if y == grid.length-1
                return true
            end
            y += 1
        end

        x = j - 1
        while x >= 0
            if grid[i][j] <= grid[i][x]
                break
            end
            if x == 0
                return true
            end
            x -= 1
        end

        return false
    end

    def self.run(path)
        grid = [[]]
        row = 0

        File.read(path).each_char do |c|
            if c == "\n"
                grid.push([])
                row += 1
            else
                grid[row].push(c.to_i)
            end
        end
        
        edgeTrees = (grid.length * 2) + (grid[0].length * 2) - 4
        visibleTrees = 0

        for i in 1..grid.length-2
            for j in 1..grid.length-2
                if isVisible(grid,i,j)
                visibleTrees += 1
                end
            end
        end
        
        visibleTrees + edgeTrees
    end
end