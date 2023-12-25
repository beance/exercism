class BinarySearch
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def search_for(key)
    lo = 0
    hi = array.length - 1
    while lo <= hi
      mid = lo + ((hi - lo) / 2)
      if array[mid] == key
        return mid
      elsif array[mid] < key
        lo = mid + 1
      else
        hi = mid - 1
      end
    end
    nil
  end
end

