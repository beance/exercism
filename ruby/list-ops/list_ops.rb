# frozen_string_literal: true

module ListOps
  def self.arrays(array)
    count = 0
    array.each { count += 1 }
    count
  end

  def self.reverser(array)
    reversed = []
    i = array.length - 1
    while i >= 0
      reversed << array[i]
      i -= 1
    end
    reversed
  end

  def self.concatter(array1, array2)
    offset = arrays(array1)
    result = Array.new(offset + arrays(array2))
    array1.each_with_index { |e, i| result[i] = e }
    array2.each_with_index { |e, i| result[offset + i] = e }
    result
  end

  def self.mapper(array, &block)
    result = Array.new(arrays(array))
    array.each_with_index { |e, i| result[i] = block.call(e) }
    result
  end

  def self.filterer(array, &block)
    result = []
    array.each { |e| result << e if block.call(e) }
    result
  end

  def self.reducer(array, &block)
    result = array.first
    array.each { |e| result = block.call(result, e) if e > 1 }
    result
  end

  def self.sum_reducer(array)
    return 0 if array.empty?

    reducer(array, &:+)
  end

  def self.factorial_reducer(array)
    return 1 if array.empty?

    reducer(array, &:*)
  end
end
