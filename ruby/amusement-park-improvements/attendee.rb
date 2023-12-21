# frozen_string_literal: true

class Attendee
  attr_reader :pass_id, :height

  def initialize(height)
    @height = height
  end

  def issue_pass!(pass_id)
    @pass_id = pass_id
  end

  def revoke_pass!
    @pass_id = nil
  end

  def has_pass?
    !@pass_id.nil?
  end

  def fits_ride?(ride_minimum_height)
    ride_minimum_height <= height
  end

  def allowed_to_ride?(ride_minimum_height)
    has_pass? && fits_ride?(ride_minimum_height)
  end
end
