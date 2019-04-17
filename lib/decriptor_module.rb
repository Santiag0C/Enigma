module Decripter
  def decryptor(text_in_shifts)
    count = 0
    time = 0
    arr = []
    while time != text_in_shifts.length
      if count == 0
          arr << @alph.rotate(combiner_decrypt[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 1
          arr << @alph.rotate(combiner_decrypt[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 2
          arr << @alph.rotate(combiner_decrypt[count])[text_in_shifts[time]]
          count += 1
          time += 1
      elsif count == 3
          arr << @alph.rotate(combiner_decrypt[count])[text_in_shifts[time]]
          count = 0
          time += 1
      end
    end
    arr
  end

  def combiner_decrypt
    sa = 0
    sum = []
    while sa != 4
      sum << (@key[sa] + @off[sa])
      sa += 1
    end
    inverter(sum)
  end

  def inverter(cominre_sum)
    cominre_sum.map do |x|
      (x-x-x)
    end
  end
end
