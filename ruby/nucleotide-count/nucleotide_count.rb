# frozen_string_literal: true

class Nucleotide
  def initialize(strand)
    raise ArgumentError if strand =~ /[^ATCG]/

    @strand = strand
  end

  def self.from_dna(str)
    new(str)
  end

  def histogram
    @nucleotides = { 'A' => 0, 'C' => 0, 'G' => 0, 'T' => 0 }
    @strand.chars.each { |i| @nucleotides[i] += 1 }
    @nucleotides
  end

  def count(char)
    histogram[char]
  end
end
