module Part2
    def self.run(path)
        totalCalories = 0
        allCalories = []
        IO.foreach(path) do |line|
            if line.chomp != ""
                totalCalories += Integer(line)
            else
                allCalories.push(totalCalories)
                totalCalories = 0
            end
        end
        allCalories.push(totalCalories).max(3).sum
    end
end