# frozen_string_literal: true

class Tournament
  LINE_FORMAT = "%-30s | %02s | %02s | %02s | %02s | %02s\n"

  def initialize
    @teams = {}
  end

  def parse(results)
    results.map do |result|
      record(*result.split(';'))
    end
  end

  def record(team, other, type)
    return record other, team, 'win' if type == 'loss'

    @teams[team] ||= Team.new team
    @teams[other] ||= Team.new other
    @teams[team].add type.to_sym
    @teams[other].add(type == 'win' ? :loss : :draw)
  end

  def self.tally(input)
    new.tap { |tournament| tournament.parse(input.split("\n")) }.to_s
  end

  def header
    format(LINE_FORMAT, *%w[Team MP W D L P])
  end

  def teams
    @teams.values.sort do |team, other|
      other.points == team.points ? team.name <=> other.name : other.points <=> team.points
    end
  end

  def to_s
    header + teams.map do |team|
      format LINE_FORMAT, team.name, team.matches, team.wins, team.draws, team.losses, team.points
    end.join
  end
end

class Team
  attr_accessor :name

  SCORE_TYPES = { win: 0, loss: 1, draw: 2 }.freeze

  def initialize(name)
    @name = name
    @scores = [0, 0, 0]
  end

  def add(score_type)
    @scores[SCORE_TYPES[score_type]] += 1
  end

  def matches
    @scores.sum
  end

  def wins
    @scores[0]
  end

  def losses
    @scores[1]
  end

  def draws
    @scores[2]
  end

  def points
    (wins * 3) + draws
  end
end