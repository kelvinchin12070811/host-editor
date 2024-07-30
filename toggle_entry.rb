# frozen_string_literal: true

require 'colorize'

require_relative './common'

def toggle_entry
  line_num = ARGV[1]
  if line_num.nil? || line_num.empty?
    puts 'Error: line did not provided, use hosts --help to get help'.colorize(:red)
    exit
  end

  line_num = line_num.to_i - 1
  contents = IO.readlines(HOST_FILE_PATH)

  response = confirmation(
    "Line to toggle: #{line_num + 1}\n  #{contents[line_num].chop}\nAre you sure to proceed?"
    .colorize(:red)
  )
  exit unless response

  create_backup

  File.open(HOST_FILE_PATH, 'w') do |file|
    contents.each_with_index do |line, index|
      if index != line_num
        file << line
        next
      end

      match = line.match(HOST_ENTYR_ROW_PATTERN)
      file << "#{match[1].empty? ? '# ' : ''}#{match[2]} #{match[3]}"
      file << " # #{match[5]}" if match[4]
      file << "\n"
    end
  end

  puts 'Entry toggled'.colorize(:green)

  exit
end
