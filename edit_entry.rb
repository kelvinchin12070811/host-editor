# frozen_string_literal: true

require_relative './config'

def edit_entry
  line_num = ARGV[1]

  if line_num.nil? || line_num.empty?
    puts 'Error: line did not provided, use hosts --help to get help'.colorize(:red)
    exit
  end
  line_num = line_num.to_i - 1
  contents = IO.readlines(HOST_FILE_PATH)
  target = contents[line_num]
  matchs = target.match(HOST_ENTYR_ROW_PATTERN)

  ip = prompt("Enter ip address (#{matchs[2]})")
  domain = prompt("Enter domain (#{matchs[3]})")
  comment = prompt("Enter comment (#{matchs[4] ? matchs[5] : 'optional'})")

  ip = ip.empty? ? matchs[2] : ip
  domain = domain.empty? ? matchs[3] : domain
  comment = if comment.empty?
              matchs[4] ? matchs[5] : ''
            else
              comment
            end

  puts 'Config to write:'
  puts "IP     : #{ip}"
  puts "Domain : #{domain}"
  puts "Comment: #{comment}" unless comment.empty?
  response = confirmation('Are you sure to proceed?'.colorize(:red))
  exit unless response

  create_backup
  File.open(HOST_FILE_PATH, 'w') do |file|
    contents.each_with_index do |line, index|
      if index != line_num
        file << line
        next
      end

      file << '# ' unless matchs[1].empty?
      file << "#{ip} #{domain}"
      file << " # #{comment}" unless comment.empty?
      file << "\n"
    end
  end

  puts 'Entry updated'.colorize(:green)

  exit
end
