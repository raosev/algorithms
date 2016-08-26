require_relative '../sorting/sorting'

# https://www.dropbox.com/s/g708jdmjiar04nl/httpatomoreillycomsourceoreillyimages595745.png?dl=0

# Forces
# INSERTION SORT need only set aside space for a single element to function properly.
# There are no complicated nested loops to implement,
# and a generic function can be written to sort many different types of
# elements simply through the use of a cmp comparator function.


# Consequences
# The optimal performance occurs when the array is already sorted,
# and arrays sorted in reverse order naturally produce the worst performance for INSERTION SORT.
# If the array is already “mostly sorted,”
# INSERTION SORT does well because there is less need to transpose the elements.


module Sorting
  class Insertion
    
    def self.sort(array)
      puts array.to_s
      for index in (1..array.size-1)
        insert(array, index, array[index])
        puts array.to_s
      end
      array
    end


    private

    def self.insert(array, pos, value)
      i = pos - 1
      while i >= 0 && array[i] > value
        array[i + 1] = array[i]
        i-=1
      end
      array[i + 1] = value
    end
  end
end


puts Sorting::Insertion.sort([3,7,2,5,1])