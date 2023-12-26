# frozen_string_literal: true

class FoodChain
  VERSES = [
    { animal: 'fly', effects: '', remark: '' },
    { animal: 'spider', effects: 'wriggled and jiggled and tickled inside her', remark: '' },
    { animal: 'bird', effects: '', remark: 'How absurd to swallow a bird!' },
    { animal: 'cat', effects: '', remark: 'Imagine that, to swallow a cat!' },
    { animal: 'dog', effects: '', remark: 'What a hog, to swallow a dog!' },
    { animal: 'goat', effects: '', remark: 'Just opened her throat and swallowed a goat!' },
    { animal: 'cow', effects: '', remark: "I don't know how she swallowed a cow!" },
    { animal: 'horse', effects: '', remark: "She's dead, of course!" }
  ].freeze

  def self.song
    VERSES.map.with_index do |current_animal, index|
      line = ["I know an old lady who swallowed a #{current_animal[:animal]}.\n"]
      line << "It #{current_animal[:effects]}.\n" unless current_animal[:effects].empty?
      line << "#{current_animal[:remark]}\n" unless current_animal[:remark].empty?

      if (1..VERSES.length - 2).include?(index)
        index.downto(1).each do |i|
          line << "She swallowed the #{VERSES[i][:animal]} to catch the #{VERSES[i - 1][:animal]}"
          previous_effect = VERSES[i - 1][:effects]
          line << " that #{previous_effect}" unless previous_effect.empty?
          line << ".\n"
        end
      end

      if index < VERSES.length - 1
        line << "I don't know why she swallowed the #{VERSES[0][:animal]}. Perhaps she'll die.\n\n"
      end
      line.join
    end.join
  end
end
