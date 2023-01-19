module Part1
    def self.run(path)
        totalCalories = 0
        maxCalories = 0
        IO.foreach(path) do |line|
            if line.chomp != ""
                totalCalories += Integer(line)
            else
                if maxCalories < totalCalories
                maxCalories = totalCalories
                end
                totalCalories = 0
            end
        end
        if maxCalories < totalCalories
            maxCalories = totalCalories
        end
        maxCalories
    end
end