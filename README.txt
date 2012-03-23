CompactSortArray
by: Russ Spivey

Description: This array class uses a "bucket sort" variation to significantly 
			   speed up sort time as compared to Ruby's internal sort (Quick Sort)
			   in many (but not all) cases. It works best with densely packed values.

			   Since it extends the Ruby's Array class, you can call any Array methods on it
			   (with the exception of some initialization methods, and sort() with blocks)

Sort time: O(k) where k is the array size (the larget element, if generated dynamically)
Limiations: This class only allows unsigned integers. Duplicates are not permitted.