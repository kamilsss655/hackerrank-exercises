# 1.4 Library example that checks if a given string 'str' is a permutation of a palidrome.
module Helpers
  # API
  def self.is_palidrome_permutation?(str)
    checker = PalidromePermutationChecker.new
    checker.is_palidrome_permutation?(str)
  end
  # Implementation
  class PalidromePermutationChecker
    def is_palidrome_permutation?(str)
      input = str.delete(' ').downcase
      chars = char_count_hash(input)
      odd_chars_count  = count_with_filter(chars.values) {|elem| elem % 2 != 0}
      even_chars_count = count_with_filter(chars.values) {|elem| elem % 2 == 0}
      if odd_chars_count == 1 && even_chars_count > 1
        true
      else
        false
      end
    end

    private

    def count_with_filter(counts, &block)
      counts.inject(0) do |acc, elem|
        if yield(elem)
          acc += 1
        else
          acc
        end
      end
    end
    
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

p Helpers.is_palidrome_permutation?('Tact Coa')
p Helpers.is_palidrome_permutation?('Tact Cofa')
p Helpers.is_palidrome_permutation?('cfb')
p Helpers.is_palidrome_permutation?('abc')
p Helpers.is_palidrome_permutation?('aho hoab')
