module Part2
    class CPU
        def initialize
            @curr_cycle = 0
            @reg_x = 1
        end
      
        def run(program)
            increment_x = 0
            cycles = 0
            screen = ""
            position = 0

            program.each do |line|
                inst, v = line.split
      
                @reg_x += increment_x
            
                if inst == "noop"
                    cycles = 1
                    increment_x = 0
                else
                    cycles = 2
                    increment_x = v.to_i
                end
      
                cycles.times do
                    @curr_cycle += 1
        
                    if position == 40
                        position = 0
                        screen << "\n"
                    end
        
                    if position >= (@reg_x - 1) and position <= (@reg_x + 1)
                        screen << "#"
                    else
                        screen << "."
                    end
        
                    position += 1
                end
            end
      
            "\n" + screen
        end
    end

    def self.run(path)
        program = File.readlines(path, chomp: true)
          
        cpu = CPU.new
        cpu.run(program)
    end
end