# frozen_string_literal: true

require_relative './common'
require_relative './config'

def create_entry
  ip = prompt('Enter ip address to map')
  domain = prompt("Enter domain to map to \"#{ip}\"")
  comment = prompt('Enter comment (optional, leave empty to skip)')
  puts "Mapping: \n#{ip} -> #{domain}"
  puts "Comment: #{comment}" unless comment.empty?

  exit unless confirmation('Is this correct?')

  hosts_file = File.open(HOST_FILE_PATH, 'a')
  hosts_file << "#{ip} #{domain}#{comment.empty? ? '' : " # #{comment}"}\n"
  hosts_file.close

  exit
end
