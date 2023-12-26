# frozen_string_literal: true

module Grep
  def self.grep(pattern, flags, files)
    pattern = "^#{pattern}$" if flags.include?('-x')
    pattern = Regexp.new(pattern, flags.include?('-i') ? Regexp::IGNORECASE : 0)
    invert = flags.include?('-v')
    output = []

    files.each do |file|
      File.foreach(file).with_index do |line, i|
        line.chomp!

        if !(line =~ pattern).nil? ^ invert
          if flags.include?('-l')
            output << file
            break
          else
            line = "#{i + 1}:#{line}" if flags.include?('-n')
            line = "#{file}:#{line}" if files.size > 1
            output << line
          end
        end
      end
    end

    output.join("\n")
  end
end
