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
  def test_offset
    enig = Enigma.new
    assert_equal 4, enig.offsets.length
  end
  def test_keys
    enig = Enigma.new
    assert_equal 4, enig.keys.length
  end
  def test_key_comb
    enig = Enigma.new
    assert_equal [21,3,43,95], enig.key_comb("21034395")
    assert_equal 4, enig.key_comb(true).length
  end
  def test_converter_offset
    enig = Enigma.new
    assert_equal [2, 1, 0, 3], enig.converter_offset("2103")
    assert_equal 4, enig.offsets_comb(true).length
  end
  def test_combiner
    enig = Enigma.new
    enig.key_comb("21034395")
    enig.offsets_comb("2103")
    assert_equal [23, 4, 43, 98], enig.combiner
  end
  def test_index_gatherer
    enig = Enigma.new
    assert_equal [18, 0, 13, 19, 8, 0, 6, 14], enig.index_gatherer(["s","a","n","t","i","a","g","o"])
  end
  def test_encryptor_decryptor
    enig = Enigma.new
    enig.key_comb("21034395")
    enig.offsets_comb("2103")
    assert_equal [23, 4, 43, 98], enig.combiner
    assert_equal ["o", "e", "c", "j", "e", "e", "w", "e"], enig.encryptor_decryptor([18, 0, 13, 19, 8, 0, 6, 14])
  end
end
