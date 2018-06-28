#!/bin/ruby

require 'json'
require 'stringio'

# Complete the hourglassSum function below.
def hourglassSum(arr)
    ax, ay, bx, by, cx, cy, dx, dy, ex, ey, fx, fy, gx, gy = 0,0,1,0,2,0,1,1,0,2,1,2,2,2 
    sum = []
    for x in 0..3 do
        for y in 0..3 do
            puts "x: #{x}, y: #{y}"
            sum << arr[ay+y][ax+x]+arr[by+y][bx+x]+arr[cy+y][cx+x]+arr[dy+y][dx+x]+arr[ey+y][ex+x]+arr[fy+y][fx+x]+arr[gy+y][gx+x]      
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
