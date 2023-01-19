module Part1
    class CPU
        def initialize
            @curr_cycle = 0
            @reg_x = 1
            @signal_strengh = 0
        end
      
        def run(program)
            increment_x = 0
            cycles = 0
            slag = 20
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
                    if @curr_cycle == slag
                        @signal_strengh += @curr_cycle * @reg_x
                        slag += 40
                    end
                end
            end
        end
      
        def getSignalStrengh
            @signal_strengh
        end
    end

    def self.run(path)
        program = File.readlines(path, chomp: true)

        cpu = CPU.new
        cpu.run(program)
        cpu.getSignalStrengh
    end
end