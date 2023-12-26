# frozen_string_literal: true

module Bob
  def self.hey(remark)
    if remark.match(/[A-Z]/) && !remark.match(/[a-z]/) && remark.strip.end_with?('?')
      "Calm down, I know what I'm doing!"
    elsif remark.match(/[A-Z]/) && !remark.match(/[a-z]/)
      'Whoa, chill out!'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    elsif remark.strip.end_with?('?')
      'Sure.'
    else
      'Whatever.'
    end
  end
end
