#!/bin/ruby

require 'json'
require 'stringio'

# Complete the twoStrings function below.
def twoStrings(s1, s2)
    hash = {}
    for pos in 0...s1.length
        hash[s1[pos]] = true
    end
    for pos in 0..s2.length
       return 'YES' if hash[s2[pos]] 
    end
    'NO'
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s1 = gets.to_s.rstrip

    s2 = gets.to_s.rstrip

    result = twoStrings s1, s2

    fptr.write result
    fptr.write "\n"
end

fptr.close()
