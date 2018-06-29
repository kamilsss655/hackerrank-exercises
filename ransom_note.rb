#!/bin/ruby

require 'json'
require 'stringio'

# Complete the checkMagazine function below.
def checkMagazine(magazine, note)
    words = {}
    magazine.each do |word|
        if words[word].nil?
            words[word] = 1
        else
            words[word] += 1
        end
    end
    good = true
    good = note.each do |note_word|
       break false if words[note_word].nil?
       words[note_word] -= 1
       break false if words[note_word] < 0
    end
    puts good ? "Yes" : "No"
end

mn = gets.rstrip.split

m = mn[0].to_i

n = mn[1].to_i

magazine = gets.rstrip.split(' ').map(&:to_s)

note = gets.rstrip.split(' ').map(&:to_s)

checkMagazine magazine, note
