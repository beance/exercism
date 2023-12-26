module House
  PHRASES = [
    { noun: 'the house that Jack built', verb: nil },
    { noun: 'the malt', verb: 'lay in' },
    { noun: 'the rat', verb: 'ate' },
    { noun: 'the cat', verb: 'killed' },
    { noun: 'the dog', verb: 'worried' },
    { noun: 'the cow with the crumpled horn', verb: 'tossed' },
    { noun: 'the maiden all forlorn', verb: 'milked' },
    { noun: 'the man all tattered and torn', verb: 'kissed' },
    { noun: 'the priest all shaven and shorn', verb: 'married' },
    { noun: 'the rooster that crowed in the morn', verb: 'woke' },
    { noun: 'the farmer sowing his corn', verb: 'kept' },
    { noun: 'the horse and the hound and the horn', verb: 'belonged to' }
  ].freeze

  def self.recite
    (0..11).map { |n| recite_verse(n) }.join("\n")
  end

  def self.recite_verse(n)
    verses = build_verses(n)
    "This is #{verses.reverse.join(' ')}.\n"
  end

  def self.build_verses(n)
    PHRASES.first(n + 1).map { |phrase| construct_phrase(phrase[:noun], phrase[:verb]) }
  end

  def self.construct_phrase(noun, verb)
    verb ? "#{noun}\nthat #{verb}" : "#{noun}"
  end
end