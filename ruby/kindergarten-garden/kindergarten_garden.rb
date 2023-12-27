# frozen_string_literal: true

class Garden
  def initialize(garden)
    @garden = garden
  end

  { 'alice' => 0, 'bob' => 1, 'charlie' => 2, 'david' => 3, 'eve' => 4,
    'fred' => 5, 'ginny' => 6, 'harriet' => 7, 'ileana' => 8, 'joseph' => 9,
    'kincaid' => 10, 'larry' => 11 }.each do |name, num|
    define_method(name.to_s) do
      @garden.split("\n").map do |line|
        line.chars.each_slice(2).map.with_index do |chars, index|
          if index == num
            chars.map do |char|
              case char
              when 'C'
                :clover
              when 'G'
                :grass
              when 'R'
                :radishes
              else
                :violets
              end
            end
          end
        end
      end.flatten.compact
    end
  end
end
