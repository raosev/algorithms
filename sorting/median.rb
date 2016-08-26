require_relative '../sorting/sorting'

module Sorting
  class Median


    # Consequences
    # MEDIAN SORT does more work than it should. Although the generated subproblems are optimal
    # (since they are both about half the size of the original problem),
    # the extra cost in producing these subproblems adds up.
    # it is sufficient to select pivot_index randomly,
    # which should avoid degenerate cases (which might happen if the original array is already mostly sorted).

    # Overview
    # https://www.dropbox.com/s/wceajmzg9zl89n6/httpatomoreillycomsourceoreillyimages595747.png?dl=0
    # Median sort in action
    # https://www.dropbox.com/s/rgv6z66qcuzbusw/median_sort_in_action.png?dl=0
    #
    def self.sort(array, left, right)
      # if the subarray to be sorted has 1 (or fewer!) elements, done.
      puts array.to_s
      return array if right <= left

      # get midpoint and median element position (1<=k<=right-left-1).
      mid = (right - left + 1)/2
      find_median(array, mid + 1, left, right)
      sort(array, left, left + mid - 1)
      sort(array, left + mid + 1, right)
    end


     private

    # In linear time, group the subarray array[left, right] around a pivot
    # element pivot=ar[pivot_index] by storing pivot into its proper
    # location, store, within the subarray (whose location is returned
    # by this function) and ensuring that all array[left,store) <= pivot and all array[store+1,right] > pivot.
    #
    # Partition method in action
    # https://www.dropbox.com/s/hed2qqi13ff14us/Captura%20de%20pantalla%202016-08-26%2017.42.47.png?dl=0
    def self.partition (array, left, right, pivot_index)
      pivot = array[pivot_index]

      # move pivot to the end of the array
      tmp = array[right]
      array[right] = array[pivot_index]
      array[pivot_index] = tmp

      # all values <= pivot are moved to front of array and pivot
      # inserted just after them.
      store = left
      for index in (left..right-1)
        if array[index] <= pivot
          tmp = array[index]
          array[index] = array[store]
          array[store] = tmp
          store+=1
        end
      end

      tmp = array[right]
      array[right] = array[store]
      array[store] = tmp
      puts array.to_s
      store
    end




    # Average-case linear time recursive algorithm to find position of kth_element in array,
    # which is modified as this computation proceeds. kth_element element being the position where the median value
    # is located
    # Note 1 <= k <= right-left+1. Worst-case is quadratic, O(n^2).
    def self.find_median(array, kth_element, left, right)
      index = select_pivot_index(array, left, right)
      pivot_index = partition(array, left, right, index)
      return pivot_index if (left + kth_element - 1) == pivot_index

      # continue the loop, narrowing the range as appropriate.
      # If we are within the left-hand side of the pivot then kth_element can stay the same.
      return find_median(array, kth_element, left, pivot_index - 1) if (left + kth_element - 1) < pivot_index
      find_median(array, kth_element - (pivot_index - left + 1),  pivot_index + 1, right)
    end


    # The find_median function must select a pivot_index
    # for A[left,right] to use during the recursion. Many strategies exist, including:
    #
    # • Select the first location (left) or the last location (right).
    # • Select a random location (left≤random≤right).

    # If the pivot_index repeatedly is chosen poorly, then find_median degrades in the worst
    # case to O(nˆ2); however, its best and average case performance is linear, or O(n).
    def self.select_pivot_index(array, left, right)
      rand(left..right)
    end

  end
end

array = [15,9,8,1,4,11,7,12,13,6,5,3,16,2,10,14]
Sorting::Median.sort(array,0 , array.size-1 )