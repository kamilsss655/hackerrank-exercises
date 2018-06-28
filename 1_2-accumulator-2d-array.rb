#!/bin/ruby

require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
    t = [[0,0],[1,0],[2,0],[1,1],[0,2],[1,2],[2,2]] 
    sum = []
    for x in 0..3 do
        for y in 0..3 do
            sum << t.inject(0) do |acc, elem|
               acc += arr[elem[1]+y][elem[0]+x] 
            end
        end
    end
    sum.max
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

arr = Array.new(6)

6.times do |i|
    arr[i] = gets.rstrip.split(' ').map(&:to_i)
end

result = hourglassSum arr

fptr.write result
fptr.write "\n"

fptr.close()
