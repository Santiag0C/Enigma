require_relative 'enigma'

read_file, write_file, key, date = ARGV


message = File.open(read_file, "r")
decrypt = File.open(write_file, "w")


enigd = Enigma.new
decrypt.write(enigd.decrypt(message.read, key, date))
decrypt.close

p "Created #{write_file} with the key #{key} and date #{date}"
