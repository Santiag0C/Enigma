module Encryptor

  def index_gatherer(input_in_array)
    index_of_input = []
    input_in_array.each do |let|
      @alph.each do |alp|
          index_of_input << @alph.index(let)  if let == alp
        end
      end
    index_of_input
  end

  def encryptor_decryptor(text_in_shifts)
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
end
