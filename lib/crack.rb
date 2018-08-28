require './enigma'
require 'pry'

  message_file = File.open(ARGV[0], "r")
  message = message_file.read.chomp

  year = ("20" + ARGV[2][-2..-1]).to_i
  day = ARGV[2][0..1].to_i
  month = ARGV[2][3].to_i
  date = Date.new(year, month, day)

  new_enigma = Enigma.new
  cracked_msg = new_enigma.crack(message, date)

  new_file = File.open(ARGV[1], "w")
  new_file.write(cracked_msg)

  puts "Created #{new_file} with the key #{new_enigma.cracked_key} and date #{ARGV[2]}"
