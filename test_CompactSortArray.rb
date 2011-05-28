# this file runs testing on the CompactSortArray class

require 'benchmark'
require 'CompactSortArray.rb'

a = Array.new
b = CompactSortArray.new

# fill array with random numbers
element_array = []
num_elements = 8888
digits_in_random_num = 4
rand_size = 10 ** digits_in_random_num
num_elements.times do
	element = rand(rand_size)
	
	# do not allow duplicate numbers
	if !element_array.include?(element)
		element_array.push(element)
	end
end

# run benchmarking
Benchmark.bm(25) do |bm|
	
	bm.report("Ruby Array.push()"){
		element_array.each do |num|
			a.push(num)
		end
	}
	
	bm.report("CompactSortArray.push()"){
		element_array.each do |num|
			b.push(num)
		end
	}

	bm.report("Ruby Array.sort()"){a.sort}
	bm.report("CompactSortArray.sort()"){b.sort}
	
end
