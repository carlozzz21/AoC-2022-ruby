day = ARGV[0].to_i

day.between?(1,25) || raise("Day must be a number between 1 and 25")

part = ARGV[1].to_i

part.between?(1,2) || raise("Part must be a number between 1 and 2")

input = ARGV[2]

if ARGV[2].nil?
    input = "test"
end

input.match("input|test") || raise("Unknown input")

filename = 
    case part
        when 1
            "first.rb"
        when 2
            "second.rb"
    end

path = "./src/#{day}/#{input}.txt"

require "./src/#{day}/#{filename}"
require "./utils.rb"

answer = eval("Part#{ARGV[1]}")::run(path)

Util::print_answer(answer, day, part)