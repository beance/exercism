# frozen_string_literal: true

module Translation
  CODON_TO_PROTEIN = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP'
  }.freeze

  def self.of_rna(rna)
    sequence = rna.chars.each_slice(3).map { |codon| CODON_TO_PROTEIN[codon.join] }.take_while { |protein| protein != 'STOP' }
    raise InvalidCodonError if sequence.include?(nil)

    sequence
  end
end

class InvalidCodonError < StandardError; end


