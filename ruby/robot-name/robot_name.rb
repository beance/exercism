# frozen_string_literal: true

class Robot
  @@name_enumerator = [*'AA000'..'ZZ999'].shuffle.each

  def initialize
    reset
  end

  def reset
    @name = @@name_enumerator.next
  end

  def self.forget
    @@name_enumerator.rewind
  end

  def name
    @name ||= @@name_enumerator.first
  end
end
