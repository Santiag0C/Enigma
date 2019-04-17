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

  def key_comb(argument_encry_decry)#used in conbiner
    if argument_encry_decry == true
      keys
      comb = @shift.map {|x| x.join}
      @key = comb_i = comb.map {|x| x.to_i}
    else
      @key = converter_key(argument_encry_decry)
    end
  end

  def converter_key(argument_encry_decry)#helpr for key comb
    argument_encry_decry.scan(/../).map do |x|
      x.to_i
    end
  end
  def converter_offset(argument_encry_decry)#helper for offser_comb
    argument_encry_decry.scan(/./).map do |x|
      x.to_i
    end
  end

  def offsets_comb(argument_encry_decry)
    if argument_encry_decry == true
      @off = of_i = offsets.scan(/./).map {|e| e.to_i}
    else
      @off = converter_offset(argument_encry_decry)
    end
  end

  def combiner#shifting
    sa = 0
    sum = []
    while sa != 4
      sum << (@key[sa] + @off[sa])
      sa += 1
    end
    sum
    #[-3,-27,-73,-20]
  end
end
