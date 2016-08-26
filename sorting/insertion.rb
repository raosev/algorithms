require_relative '../sorting/sorting'


module Sorting
  class Insertion
    
    def self.sort(array)
      for index in (1..array.size-1)
        insert(array, index, array[index])
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