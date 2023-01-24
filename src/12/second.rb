require "set"

module Part2
    def self.run(path)
        arr_start, finish, grid = parse_input(path)
        arr_start.map{ |start| compute_path(start, finish, grid) }.min
    end

    def self.compute_path(start, finish, grid)
        graph = []
        seen = Set[]
        
        graph << Set[start]
        seen.add(start)

        depth = 0
        loop do
            new_level = Set[]

            level = graph[depth]
    
            level.each do |node|
                adjacents = get_adjacents(node[0], node[1], grid)
                adjacents.each do |adjacent|
                    new_level.add(adjacent) unless seen.include?(adjacent)
                    seen.add(adjacent)
                end
            end
    
            depth += 1
            graph << new_level

            if new_level.include?(finish)
                break
            end
        end

        graph.size - 1
    end

    def self.get_adjacents(x, y, grid)
        outputs = []

        if x+1 < grid.first.size and (grid[y][x+1].ord - grid[y][x].ord <= 1)
            outputs << [x+1,y]
        end

        if x-1 >= 0 and (grid[y][x-1].ord - grid[y][x].ord <= 1)
            outputs << [x-1,y]
        end

        if y-1 >= 0 and (grid[y-1][x].ord - grid[y][x].ord <= 1)
            outputs << [x,y-1]
        end

        if y+1 <= grid.size - 1 and (grid[y+1][x].ord - grid[y][x].ord <= 1)
            outputs << [x,y+1]
        end

        outputs
    end

    def self.parse_input(path)
        arr_start = []
        finish = []
        grid = File.readlines(path, chomp: true).map.with_index do |line, y|
            if line[0] == "S"
                line[0] = "a"
            end

            arr_start << [0,y]

            if line.include?("E")
                x = line.index("E")
                finish = [x, y]
                line[x] = "z"
            end

            line.chars
        end
        [arr_start, finish, grid]
    end
end