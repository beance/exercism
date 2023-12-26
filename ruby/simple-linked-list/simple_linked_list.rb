# frozen_string_literal: true

class Element
  attr_reader :datum, :next
  attr_accessor :next

  def initialize(value)
    @datum = value
  end
end

class SimpleLinkedList
  attr_accessor :head

  def initialize(data = [])
    @head = nil
    data.each { |datum| push(Element.new(datum)) }
  end

  def push(element)
    element.next = @head
    @head = element
    self
  end

  def pop
    return nil if @head.nil?

    element = @head
    @head = @head.next
    element.next = nil
    element
  end

  def to_a
    accum = []
    return accum if @head.nil?

    element = @head
    while element
      accum << element.datum
      element = element.next
    end
    accum
  end

  def reverse!
    return self if @head.nil?

    accum = []
    element = @head
    while element
      accum << element
      element = element.next
    end
    @head = nil
    accum.each { |item| push(item) }
    self
  end
end
