require './lib/enigma'


file_name = ""  #do we need these?
encrypted_file_name = ""

ARGV == [file_name, encrypted_file_name]

  message_file = File.open(ARGV[0], "r")
  message = message_file.read

  new_enigma = Enigma.new
  encrypted_msg = new_enigma.encrypt(message, "12345")

  new_file = File.open(ARGV[1], "w")
  new_file.write(encrypted.msg)

  puts "Created #{new_file} with the key #{key} and date #{date}"
