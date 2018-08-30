require './lib/enigma'

  message_file = File.open(ARGV[0], "r")
  message = message_file.read.chomp

  new_enigma = Enigma.new
  encrypted_msg = new_enigma.encrypt(message)

  new_file = File.open(ARGV[1], "w")
  new_file.write(encrypted_msg)

  puts "Created #{new_file} with the key #{new_enigma.key} and date #{new_enigma.date}"
