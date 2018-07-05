# Write a function that sorts the keys in hash by the length of the key as string.
# INPUT: { abc: 'hello', 'another_key' => 123, 4567 => 'third' }
# OUTPUT: ["abc", "4567", "another_key"]

def sort_hash_keys(h)
  h.keys.map(&:to_s).sort_by(&:length)
end

puts sort_hash_keys({ abc: 'hello', 'another_key' => 123, 4567 => 'third' })