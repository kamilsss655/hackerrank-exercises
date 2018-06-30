# Library example that checks if a given string 'str' is a permutation of a string 'original'.
module Helpers
  # API
  def self.is_permutation?(str, original)
    checker = PermutationChecker.new
    checker.is_permutation?(str, original)
  end
  # Implementation
  class PermutationChecker
    def is_permutation?(str, original)
      return false if str == original
      return false if str.length != original.length
      original_chars = char_count_hash(original)
      str_chars = char_count_hash(str)
      original_chars == str_chars
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

p Helpers.is_permutation?('cab', 'abc')
p Helpers.is_permutation?('cfb', 'abb')
p Helpers.is_permutation?('abc', 'abcd')
