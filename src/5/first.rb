module Part1
    def self.run(path)
        crates, instructions = File.read(path).split("\n\n")

        maxStacks = crates.scan(/\d+/).max.to_i
        
        stacks = []
        
        for i in 0..maxStacks-1
            stacks.push([])
        end
        
        crates.split("\n")[0..-2].each do |line|
            line.scan(/[A-Z]|\s{4}/).map{|crate| crate.strip}.each_with_index do |crate, index|
                unless crate.empty?
                    stacks[index].push(crate)
                end
            end
        end

        instructions.split("\n").each do |instruction|
            numbers = instruction.scan(/\d+/).map{|n| n.to_i - 1}
            for i in 0..numbers[0]
                stacks[numbers[2]].unshift(stacks[numbers[1]].shift())
            end
        end

        stacks.map { |stack| stack[0] }.join
    end
end