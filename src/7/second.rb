module Part2
    class File
        attr_reader :size
        
        def initialize(name, size)
            @name = name
            @size = size
        end
    end
      
    class Directory
        attr_reader :parent
        
        def initialize(name, parent)
            @name = name
            @parent = parent
            @content = {}
        end
      
        def add(name, file)
            @content[name] = file
        end
        
        def size(sizes)
            total = 0
            @content.each do |_, file|
                if file.class.to_s == "Part2::File"
                    total += file.size
                else
                    total += file.size(sizes)
                end
            end
            sizes.push(total)
            return total
        end
      
        def getDir(path)
            @content[path]
        end
    end
      
    class SystemFiles
        def initialize
            @root = Directory.new("/", nil)
            @current = nil
        end

        def mkdir(dirname)
            @current.add(dirname, Directory.new(dirname, @current))
        end

        def touch(filename, size)
            @current.add(filename, File.new(filename, size))
        end

        def cd(path)
            if path == "/"
                @current = @root
            elsif path == ".."
                @current = @current.parent
            else
                @current = @current.getDir(path)
            end
        end
      
        def getAllSizes()
            sizes = []
            @root.size(sizes)
            return sizes
        end
    end

    TOTAL_SPACE = 70000000
    SPACE_UPDATE = 30000000
    
    def self.run(path)
        s = SystemFiles.new

        IO.foreach(path) do |command|
            c = command.strip.split(" ")
            case command
                when /\$ cd ([a-z]+|\/|..)/
                    s.cd(c[2])
                when /dir/
                    s.mkdir(c[1])
                when /\d+ [a-z]+(.[a-z]+)?/
                    s.touch(c[1], c[0].to_i)
            end
        end

        unusedSpace = TOTAL_SPACE - s.getAllSizes.max
        freeSpace = SPACE_UPDATE - unusedSpace
        s.getAllSizes.filter{ |size| size>=freeSpace }.min
    end
end