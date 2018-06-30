# 1.5 There are three types of edits that can be performed on strings:
# insert a character, remove a character, or replace a character.
# Given two strings, write a function to check if they are one edit (or zero edits) away.
module Helpers
  # API
  def self.is_one_away?(s1, s2)
    checker = OneAwayChecker.new
    checker.is_one_away?(s1, s2)
  end
  # Implementation
  class OneAwayChecker
    def is_one_away?(s1, s2)
      s1_hash = char_count_hash(s1)
      s2_hash = char_count_hash(s2)
      diff_hash = {}
      s1_hash.map do |k,v|
        s2_hash[k] = 0 if s2_hash[k].nil?
        diff_hash[k] = v - s2_hash[k]
      end
      sum = diff_hash.values.sum
      sum <= 1 ? true : false
    end

    private
    # Returns count of characters for a given input (eg. a => 2, b => 1)
    def char_count_hash(input)
      temp_hash = {}
      input.each_char do |char|
        if temp_hash[char].nil?
          temp_hash[char] = 1
        else
          temp_hash[char] += 1
        end
      end
      temp_hash
    end
  end
end

# ------- Example --------

p Helpers.is_one_away?('pale', 'ple')
p Helpers.is_one_away?('pales', 'pale')
p Helpers.is_one_away?('pale', 'bale')
p Helpers.is_one_away?('pale', 'bake')
