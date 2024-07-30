# frozen_string_literal: true

require 'colorize'

require_relative './config'

def list_entries
  puts 'Line number: Content // Comments'.colorize(:yellow)
  IO.readlines(HOST_FILE_PATH).each_with_index do |line, line_num|
    matches = line.match(HOST_ENTYR_ROW_PATTERN)
    next unless matches
    next if line_num < 5

    colour = matches[1].empty? ? :green : :red
    print "#{line_num + 1}: ".colorize(colour)
    print "#{matches[2]} -> #{matches[3]}".colorize(colour)
    print " // #{matches[5]}".colorize(:white) if matches[4]
    puts ''
  end

  exit
end
