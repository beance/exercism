# frozen_string_literal: true

class CircularBuffer
  class BufferEmptyException < StandardError; end

  class BufferFullException < StandardError; end

  def initialize(size)
    @size = size
    @buffer = Array.new(@size, nil)
  end

  def read
    raise CircularBuffer::BufferEmptyException if @buffer.first.nil?

    @buffer << nil
    @buffer.shift
  end

  def write(element)
    @buffer.map.with_index do |e, i|
      return @buffer[i] = element if e.nil?
    end
    raise BufferFullException
  end

  def write!(element)
    read unless @buffer.count(nil).positive?
    write(element)
  end

  def clear
    @buffer.map! { nil }
  end
end
