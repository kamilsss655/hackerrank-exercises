# Given an array of distinct integer values, count the number of pairs of integers that have a difference dist.
# O(N) solution using hash table.
def pair_diff(dist, arr)
  hash_table = arr.inject({}) do |acc, elem|
    acc.tap { acc[elem] = true }
  end
  pairs = 0
  arr.each do |elem|
    pairs += 1 if hash_table[elem-dist]
    pairs += 1 if hash_table[elem+dist]
    # puts "#{elem},#{elem-dist},#{hash_table[elem-dist]}"
    # puts "#{elem},#{elem+dist},#{hash_table[elem+dist]}"
  end
  pairs
end

p pair_diff(2, [1,7,5,9,2,12,3])