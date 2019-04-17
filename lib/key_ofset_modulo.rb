module OffsetKey
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
end
