module Sorting


  # Terminology
  # A collection of comparable elements A is presented to be sorted; we use the nota- tions A[i]
  # and ai to refer to the ith element of the collection. By convention, the first element in
  # the collection is considered to be A[0].
  # For notational convenience, we define
  #
  # A[low, low+n) to be the subcollection A[low] ... A[low+n–1] of n elements,
  # whereas
  # A[low,low+n] describes the subcollection A[low] ... A[low+n] of n+1 elements.
  #
  # To sort a collection, the intent is to order the elements A such that
  # if A[i]<A[j], then i<j.
  # If there are duplicate elements, then in the resulting ordered collection these elements
  # must be contiguous; that is, if A[i]=A[j] in a sorted collection,
  # then there can be no k such that i<k<j and A[i]≠A[k].
  # The sorted collection A must be a permutation of the elements that originally formed A.


  # For the Sorting algorithms we assume the existence of a comparator function,
  # called cmp, which compares elements:
  # p to q and returns 0 if p=q, a negative number if p<q, and a positive number if p>q
end