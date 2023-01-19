module Part2
    def self.run(path)
        count = 0
        
        IO.readlines(path, chomp: true).each do |pairs|
            interval1, interval2 = pairs.split(",")
            a, b = interval1.split("-")
            c, d = interval2.split("-")
            
            a = Integer(a)
            b = Integer(b)
            c = Integer(c)
            d = Integer(d)
            
            if a <= c and b >= d
                count += 1
            elsif c <= a and d >= b
                count += 1
            elsif a <= c and b >= c
                count += 1
            elsif a <= d and b >= d
                count += 1
            end
        end
        
        count
    end
end