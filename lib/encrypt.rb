require_relative 'enigma'

read_file, write_file = ARGV


message = File.open(read_file, "r")
encrypt = File.open(write_file, "w")


enig = Enigma.new
encrypt.write(enig.encrypt(message.read))
encrypt.close

p "Created #{write_file} with the key #{enig.shift.flatten.join} and date #{enig.off.join}"




# p e.encrypt("hello world", "02207016" ,"1734")
# p e.decrypt("keder ohulw", "02207016", "1734")
  #
  # puts "if you want to encript type encrypt"
  # puts "and to decrypt type decrypt"
  # input = gets.chomp
  # if input == "decrypt"
  #   puts "type a mesage to decrypt"
  #     mesage = gets.chomp
  #   puts "type a key that consists of 8 numbers"
  #   puts "example 02207016"
  #     key = gets.chomp
  #   puts "now tipe the date key this is a number of"
  #   puts "4 digits example 1734"
  #     date = gets.chomp
  #   p e.decrypt(mesage, key, date)
  # elsif input == "encrypt"
  #   puts "type a mesage to encrypt"
  #     mesage = gets.chomp
  #   puts "type a key that consists of 8 numbers"
  #   puts "example 02207016"
  #     key = gets.chomp
  #   puts "now tipe the date key this is a number of"
  #   puts "4 digits example 1734"
  #     date = gets.chomp
  #   p e.encrypt(mesage, key, date)
  # end
