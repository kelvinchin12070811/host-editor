# frozen_string_literal: true

require 'colorize'
require 'fileutils'

require_relative './config'

def prompt(message)
  puts "#{message}:"
  print '> '.colorize(:black)
  $stdin.gets.chop
end

def confirmation(message)
  puts "#{message}:"
  print 'y/N> '.colorize(:black)
  response = $stdin.gets.chop
  %w[y Y].include?(response)
end

def create_backup
  FileUtils.rm("#{HOST_FILE_PATH}.bup") if File.exist?("#{HOST_FILE_PATH}.bup")
  FileUtils.cp(HOST_FILE_PATH, "#{HOST_FILE_PATH}.bup")
  puts "Backup created at #{HOST_FILE_PATH}.bup"
end
