# frozen_string_literal: true

class PigLatin
  def self.translate(phrase)
    phrase.scan(/\w+\b/).map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    if word.start_with?('a', 'e', 'i', 'o', 'u', 'yt', 'xr')
      "#{word}ay"
    elsif (matches = word.match(/\A(.?qu|y|[^aeiouy]+)(.+)\Z/))
      "#{matches[2]}#{matches[1]}ay"
    end
  end
end