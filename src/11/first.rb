module Part1  
    class Monkey
        def initialize(items, data)
            @items = items 
            @test = data[0]
            @idTrue = data[1] 
            @idFalse= data[2]
            @inspections = 0
        end
    
        def inspectItems
            outputs = []
            @inspections += @items.size
            until @items.empty?
                item = @items.pop
                newItem = (op(item) / 3).to_i
                outputs << testItem(newItem)
            end
            outputs
        end

        def catch(newItem)
            @items << newItem
        end

        def getInspections
            @inspections
        end

        private
        def testItem(newItem)
            [(newItem % @test == 0)? @idTrue : @idFalse, newItem]
        end
    end
    
    class MonkeySum < Monkey
        def initialize(items, data, num)
            super(items, data)
            @num = num
        end

        private
        def op(old)
            old + @num
        end
    end

    class MonkeyMultiply < Monkey
        def initialize(items, data, num)
            super(items, data)
            @num = num
        end

        private
        def op(old)
            old * @num
        end
    end

    class MonkeySquared < Monkey
        private 
        def op(old)
            old * old
        end
    end

    def self.run(path)
        monkeys = []

        File.read(path).split("\n\n").each do |m|
            l = m.split("\n")
            items = l[1].scan(/\d+/).map {|i| i.to_i}
            data = []
            for i in 3..5
                data << l[i][/\d+/].to_i
            end
            if l[2].match(/\* old/)
                monkeys << MonkeySquared.new(items, data)
            elsif l[2].match(/\*/)
                monkeys << MonkeyMultiply.new(items, data, l[2][/\d+/].to_i)
            else 
                monkeys << MonkeySum.new(items, data, l[2][/\d+/].to_i)
            end
        end

        20.times do
            monkeys.each do |monkey|
                monkey.inspectItems.each do |i, newItem|
                    monkeys[i].catch(newItem)
                end
            end
        end

        monkeys.map{ |m| m.getInspections}.max(2).inject(1){ |result, num| result * num }
    end
end