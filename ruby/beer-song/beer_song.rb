# frozen_string_literal: true

module BeerSong
  def self.recite(nth, n)
    nth.downto(nth - n + 1).map { |i| verse(i) }.join("\n")
  end

  def self.verse(nth)
    case nth
    when 0
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    when 1
      "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    when 2
      "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
    else
      "#{nth} bottles of beer on the wall, #{nth} bottles of beer.\nTake one down and pass it around, #{nth - 1} bottles of beer on the wall.\n"
    end
  end
end
