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
end
