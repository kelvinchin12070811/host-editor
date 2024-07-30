# frozen_string_literal: true

def render_help
  puts 'Hosts Editor'
  puts '============'
  puts 'Usage: hosts <command> <args>'
  puts '  --help, -h          : Show this message'
  puts '  list                : List all the entry in hosts file'
  puts '  create              : Create new entry in the hosts file'
  puts '  toggle <line_number>: Toggle the state of the entry'
  puts '  edit <line_number>  : Modify the selected entry'
  puts '  delete <line_number>: Delete a record from the hosts file'
  puts '  vim                 : Open hosts file in vim'
  puts '  sysinfo             : Show system information with fastfetch'

  exit
end
