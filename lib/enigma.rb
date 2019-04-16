require 'pry'
class Enigma
  attr_reader :alph, :alpha
  def initialize
    @alpha = ("a".."z").to_a
    @alph = ("a".."z").to_a << " "
    @shift
  end

  def offsets#date## used in combiner
    date = Time.new
    date = date.strftime("%d%m%y")
    squdat = date.to_i * date.to_i
    squdat = squdat.to_s
    return squdat[-4..-1]
  end

  def keys #used in combiner
    ran = 4.times.map { rand(10) }
    a = 0, ran[0]
    b = ran[0],ran[1]
    c = ran[1],ran[2]
    d = ran[2],ran[3]
    @shift = [a, b, c, d]
  end

  def key_comb
    comb = @shift.map {|x| x.join}
    comb_i = comb.map {|x| x.to_i}
  end

  def offsets_comb
    # binding.pry
    of_i = offsets.scan(/./).map {|e| e.to_i}
  end

  def combiner#shifting
    sa = 0
    sum = []
    while sa != 4
      sum << (key_comb[sa] + offsets_comb[sa])
      sa += 1
    end
    sum
    [3,27,73,20]
  end

  def index_gatherer(input)
    index_of_input = []
    input.each do |let|
      @alph.each do |alp|# _with_index do |val, index|
          index_of_input << @alph.index(let)  if let == alp
        end
      end
    encryptor(index_of_input)
  end

  def input_converter(message) #helpre for index gatherer
    index_gatherer(message.chars)
  end

  def encryptor(text_in_shifts)
    count = 0
    time = 0
    arr = []
    while time != text_in_shifts.length
      if count == 0
          arr << @alph.rotate(combiner[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 1
          arr << @alph.rotate(combiner[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 2
          arr << @alph.rotate(combiner[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 3
          arr << @alph.rotate(combiner[count])[text_in_shifts[time]]
          count = 0
          time += 1
      end
    end
    arr
  end
  def encrypt(message)#, key = true, date = true)
    input_converter(message).join
  end
end

e = Enigma.new
e.keys
# p e.key_comb
# p e.offsets_comb
# p e.alph
# p e.combiner
# p e.index_gatherer
# p e.encryptor
p e.encrypt("hello world")
# p e.alpha.rotate(0)
