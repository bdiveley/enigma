require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
# require 'pry'

class EnigmaTest < Minitest::Test

  def test_instance_exists
    new_enigma = Enigma.new
    assert_instance_of Enigma, new_enigma
  end

  def test_if_character_map_exists
    new_enigma = Enigma.new
    actual = new_enigma.character_map
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", " ", ".", ","]
    assert_equal expected, actual
  end

  def test_if_key_rotation_returns_new_array
     new_enigma = Enigma.new
     # binding.pry
     actual = new_enigma.key_rotation("12345")
     expected = [12, 23, 34, 45]
     assert_equal expected, actual
  end

  def test_if_date_rotation_returns_new_array
    new_enigma = Enigma.new
    actual = new_enigma.date_rotation(Date.today)
    expected = [9, 1, 2, 4]
    assert_equal expected, actual
  end

  def test_if_final_rotation_sums_key_and_date
    new_enigma = Enigma.new
    actual = new_enigma.final_rotation("12345", Date.today)
    expected = [21, 24, 36, 49]
    assert_equal expected, actual
  end

  def test_four_letter_encryption
    new_enigma = Enigma.new
    actual = new_enigma.encrypt("hope", "12345", Date.today)
    expected = "2,mo"
    assert_equal expected, actual
  end

  def test_larger_than_four_letter_encryption
    new_enigma = Enigma.new
    actual = new_enigma.encrypt("hopehope", "12345", Date.today)
    expected = "2,mo2,mo"
    assert_equal expected, actual
  end

  def test_full_msg_encryption
    new_enigma = Enigma.new
    actual = new_enigma.encrypt("this is so secret ..end..", "12345", Date.today)
    expected = "b5f2s6pha,72z0oobv8iz.ait"
    assert_equal expected, actual
  end

  def test_no_errors_for_one_argument_for_encrypt
    new_enigma = Enigma.new
    actual = new_enigma.encrypt("this is so secret ..end..")
    expected = "b5f2s6pha,72z0oobv8iz.ait"
    assert_equal expected, actual
  end

end
