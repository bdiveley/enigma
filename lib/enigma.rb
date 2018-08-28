require 'date'
require 'pry'

class Enigma
  attr_reader :character_map,
              :key,
              :date


  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    @key = key
    @date = date
  end

  def key_rotation(key)
    rotate = key.chars
    rotate.map.with_index do |number, index|
      if index <= 3
        number += rotate[index + 1]
        number.to_i
      end
    end.compact
  end

  def date_rotation(date)
    final_date = date.strftime('%d') + date.strftime('%m') + date.strftime('%y')
    last_four = (final_date.to_i ** 2).to_s[-4..-1]
    last_four_array = last_four.chars
    last_four_array.map do |number|
      number.to_i
    end

  end

  def final_rotation(key, date)
    k_rotation = key_rotation(key)
    d_rotation = date_rotation(date)
    [k_rotation, d_rotation].transpose.map do |number|
        number.sum
      end
  end

  def encrypt(my_message, key=rand(10000..99999).to_s, date=Date.today)
    @key = key
    @date = date
    message_array = my_message.downcase.chars
    rotation_number = final_rotation(key, date)

    message_array.map.with_index do |letter, index|
      letter_index = @character_map.find_index(letter)
      rotated_array = @character_map.rotate(rotation_number[index % 4])
      rotated_array[letter_index]
    end.join
  end

  def decrypt(output, key, date=Date.today)
    @key = key
    @date = date
    message_array = output.downcase.chars
    rotation_number = final_rotation(key, date)

    message_array.map.with_index do |letter, index|
      letter_index = @character_map.find_index(letter)
      rotated_array = @character_map.rotate(-rotation_number[index % 4])
      rotated_array[letter_index]
    end.join
  end

  def crack(encrypted_string, date=Date.today)

    decrypted_string = '       '
    known_string = "..end.."
    key_guess = "10000"
    until decrypted_string[-7..-1]  == known_string
      decrypted_string = decrypt(encrypted_string, key_guess, date)
      key_guess = (key_guess.to_i + 1).to_s
    end
    decrypted_string
  end

end
