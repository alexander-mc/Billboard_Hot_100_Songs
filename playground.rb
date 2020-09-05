## chomp
# name = gets.chomp
# puts "Hello #{name}, nice to meet you!"

## sort

a = ["200", "100", "1000"]
b = [200, 100, 1000]

puts "sort integer strings using sort"
puts a.sort
puts "sort integer strings using sort by"
puts a.sort_by{|e| e.to_i}
puts "sort integers"
puts b.sort

# a = ["apple", "cantalope", "bananasssssssssssss", "banana"]
# puts a.sort