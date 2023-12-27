# frozen_string_literal: true

class Element
  attr_accessor :datum, :next, :prev

  def initialize(datum)
    @datum = datum
    @next = nil
    @prev = nil
  end
end

class Deque
  def initialize(array = [])
    @first = nil
    @last = nil

    array.each { |item| push(Element.new(item)) }
  end

  def push(datum)
    element = Element.new(datum)
    element.prev = @last

    element.prev.next = element unless element.prev.nil?

    @first = element if @first.nil?
    @last = element

    self
  end

  def unshift(datum)
    element = Element.new(datum)
    element.next = @first

    element.next.prev = element unless element.next.nil?

    @first = element
    @last = element if @last.nil?

    self
  end

  def pop
    element = @last

    if @first.eql?(@last)
      @first = nil
      @last = nil
    end

    @last = element.prev
    element.prev.next = nil unless element.prev.nil?
    element.datum
  end

  def shift
    element = @first

    if @first.eql?(@last)
      @first = nil
      @last = nil
    end

    @first = element.next
    element.next.prev = nil unless element.next.nil?
    element.datum
  end
end
