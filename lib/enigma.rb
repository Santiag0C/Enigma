require 'pry'
require_relative 'key_ofset_modulo'
require_relative 'encryptor_decryptor_module'
require_relative 'decriptor_module'
class Enigma
  include OffsetKey
  include Encryptor
  include Decripter
  attr_reader :alph, :alpha
  def initialize
    @alpha = ("a".."z").to_a
    @alph = ("a".."z").to_a << " "
    @shift
  end

  def input_converter(message)
    index_gatherer(message.chars)
  end

  def encrypt(message, key = true, date = true)
    index_inp = input_converter(message)
    key_comb(key)
    offsets_comb(date)
    combiner
    encryptor_decryptor(index_inp).join
  end

  def decrypt(message, key = true, date = true)
    index_inp = input_converter(message)
    key_comb(key)
    offsets_comb(date)
    combiner_decrypt
    decryptor(index_inp).join
  end
end
