# frozen_string_literal: true

require 'colorize'

require_relative './config'
require_relative './common'

def delete_entry
  line_num = ARGV[1]

  if line_num.nil? || line_num.empty?
    puts 'Error: line did not provided, use hosts --help to get help'.colorize(:red)
    exit
  end
  line_num = line_num.to_i - 1

  hosts_file = IO.readlines(HOST_FILE_PATH)
  target = hosts_file[line_num]
  response = confirmation("Line to delete: \n  #{target.chop}\nAre you suer to continue?".colorize(:red))
  exit unless response

  create_backup
  File.open(HOST_FILE_PATH, 'w') do |file|
    hosts_file.each_with_index do |line, index|
      next if index == line_num

      file << line
    end
  end

  puts 'Line deleted'.colorize(:green)

  exit
end
