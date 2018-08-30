require './lib/enigma'

  message_file = File.open(ARGV[0], "r")
  message = message_file.read.chomp

  year = ("20" + ARGV[3][-2..-1]).to_i
  day = ARGV[3][0..1].to_i
  month = ARGV[3][3].to_i
  date = Date.new(year, month, day)

  new_enigma = Enigma.new
  decrypted_msg = new_enigma.decrypt(message, ARGV[2], date)

  new_file = File.open(ARGV[1], "w")
  new_file.write(decrypted_msg)

  puts "Created #{new_file} with the key #{ARGV[2]} and date #{ARGV[3]}"
