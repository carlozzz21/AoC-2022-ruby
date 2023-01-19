module Part1
    def self.run(path)
        buffer = []
        position = 0
        datastream = File.read(path)
        while buffer.size < 4
            c = datastream[position]
            if buffer.include?(c)
                index = buffer.index(c)
                buffer = buffer[index+1..-1]
            end
            buffer.push(c)
            position += 1
        end
        position
    end
end