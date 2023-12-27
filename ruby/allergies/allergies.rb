# frozen_string_literal: true

class Allergies
  ALLERGIES = { 'eggs' => 1, 'peanuts' => 2, 'shellfish' => 4, 'strawberries' => 8,
                'tomatoes' => 16, 'chocolate' => 32, 'pollen' => 64, 'cats' => 128 }.freeze

  def initialize(allergies)
    @allergies = allergies
  end

  def allergic_to?(allergy)
    ALLERGIES[allergy] & @allergies == ALLERGIES[allergy]
  end

  def list
    ALLERGIES.select { |allergy, _score| allergic_to?(allergy) }.keys
  end
end
