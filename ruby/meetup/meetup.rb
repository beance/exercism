# frozen_string_literal: true

require 'date'
class Meetup
  DAYS = { monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7 }.freeze
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, schedule)
    days = DateTime.new(@year, @month, 1).step(Date.new(@year, @month, -1)).select { |d| d.cwday == DAYS[day] }
    case schedule
    when :first
      days[0]
    when :second
      days[1]
    when :third
      days[2]
    when :fourth
      days[3]
    when :last
      days[-1]
    when :teenth
      days.find { |d| d.day <= 19 && d.day >= 13 }
    end
  end
end
