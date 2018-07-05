#!/bin/ruby

require 'json'
require 'stringio'

# Complete the alternatingCharacters function below.
# O(n) solution
def alternatingCharacters(s)
    deletions = 0
    for i in 0..s.length - 2
        deletions += 1 if s[i] == s[i+1] 
    end
    deletions
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

q = gets.to_i

q.times do |q_itr|
    s = gets.to_s.rstrip

    result = alternatingCharacters s

    fptr.write result
    fptr.write "\n"
end

fptr.close()
