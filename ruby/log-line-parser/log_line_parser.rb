# frozen_string_literal: true

class LogLineParser
  def initialize(line)
    @line = line
  end

  def message
    @line.scan(/: (.*)/).join.strip
  end

  def log_level
    @line.scan(/\[(.*)\]/).join.downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
