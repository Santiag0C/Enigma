require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma'

class EnigmaTest < Minitest::Test
  def test_existance
    enig = Enigma.new
    assert_instance_of Enigma, enig
  end
  def test_alphabet
    enig = Enigma.new
    assert_equal ("a".."z").to_a << " " , enig.alph
    assert_equal ("a".."z").to_a, enig.alpha
  end
  def test_input_converter
    enig = Enigma.new
    assert_equal [18, 0, 13, 19], enig.input_converter("sant")
  end
  def test_encrypt
    enig = Enigma.new
    assert_equal "mmtocmmj", enig.encrypt("santiago", "20103045", "1234")
  end
  def test_decrypt
    enig = Enigma.new
    assert_equal "santiago", enig.decrypt("mmtocmmj", "20103045", "1234")
  end
end
