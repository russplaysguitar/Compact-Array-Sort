# CompactSortArray
# by: Russ Spivey
#
# Description: This array class uses a "bucket sort" variation to significantly 
# 			   speed up sort time as compared to Ruby's internal sort (Quick Sort)
#			   in many (but not all) cases. It works best with densely packed values.
#
#			   Since it extends the Ruby's Array class, you can call any Array methods on it
#			   (with the exception of some initialization methods, and sort() with blocks)
#
# Sort time: O(k) where k is the array size (the larget element, if generated dynamically)
# Limiations: This class only allows unsigned integers. Duplicates are not permitted.

class CompactSortArray < Array
	def initialize(size=0)
		@hash_table = Array.new(size)
		super
	end

	# this is 2-3 times slower than Ruby's Array.push()
	def push(x)
		# require unsigned integers
		if x < 0 || !x.integer?
			raise "Error: Value must be a non-negative integer"
		end
		
		# prevent duplicate values
		if !@hash_table[x].nil?
			raise "Error: No duplicates allowed"
		end
		
		@hash_table[x] = x
		super
	end
	
	def sort
		# compact() just removes nil values in the array.
		# Since values are already stored in order (with values as keys),
		#	 removing nil values returns a perfectly ordered array
		@hash_table.compact 
	end
	
	def sort!
		self.clear
		self.concat(self.sort)
	end
	
	def []=(key,value)
		@hash_table[value]=value
		super
	end
end
