require 'pry'
class Enigma
  def initialize
    alph = ("a".."z").to_a << " "
  end

  def offsets#date
    date = Time.new
    date = date.strftime("%d%m%y")
    squdat = date.to_i * date.to_i
    squdat = squdat.to_s
    return squdat[-4..-1]
  end

  def keys #used in combiner
    ran = 5.times.map { rand(10) }
    a = ran[0],ran[1]
    b = ran[1],ran[2]
    c = ran[2],ran[3]
    d = ran[3],ran[4]
    shift = [a, b, c, d]
  end

  def combiner
    comb = keys.map {|x| x.join}
    p comb.map {|x| x.to_i}
  end

end
e = Enigma.new
e.combiner
