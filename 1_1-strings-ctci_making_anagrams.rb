#!/bin/ruby

require 'json'
require 'stringio'

# Complete the makeAnagram function below.
def makeAnagram(a, b)
    diff = 0
    if a.length >= b.length
        longer, shorter = a, b
    else
        longer, shorter = b, a
    end
    longer_count = count_letters(longer)
    shorter.each_char do |char|
        if longer_count[char].nil?
            diff += 1
        elsif longer_count[char] > 1
            longer_count[char] -= 1
        elsif longer_count[char] == 1
            longer_count.delete(char)
        end
    end
    longer_count.values.inject(diff) {|acc, elem| acc += elem}
end

def count_letters(s)
   count_hash = {}
   s.each_char do |letter|
     if count_hash[letter].nil?
       count_hash[letter] = 1
     else
       count_hash[letter] += 1
     end
   end
   count_hash
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

a = gets.to_s.rstrip

b = gets.to_s.rstrip

res = makeAnagram a, b

fptr.write res
fptr.write "\n"

fptr.close()
