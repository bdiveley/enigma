require 'date'
require 'pry'

class Enigma
  attr_reader :character_map


  def initialize
    @character_map = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
  end

  def key_rotation(key)
    rotate = key.chars
    rotate.map.with_index do |number, index|
      if index <= 3
        number += rotate[index + 1]
      end
    end.compact
  end
end

# new_enigma = Enigma.new
# binding.pry
# new_enigma.key_rotation("12345")
