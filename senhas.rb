class PasswordGenerator
  LOWERCASE = ('a'..'z').to_a
  UPPERCASE = ('A'..'Z').to_a
  NUMBERS   = ('0'..'9').to_a
  SYMBOLS   = ['!', '@', '#', '$', '%', '&', '*', '+', '-', '=']

  def initialize(length: 12, use_lowercase: true, use_uppercase: true, use_numbers: true, use_symbols: true)
    @length = length
    @use_lowercase = use_lowercase
    @use_uppercase = use_uppercase
    @use_numbers = use_numbers
    @use_symbols = use_symbols
  end

  def generate
    pool = []
    pool += LOWERCASE if @use_lowercase
    pool += UPPERCASE if @use_uppercase
    pool += NUMBERS if @use_numbers
    pool += SYMBOLS if @use_symbols

    raise "Nenhum tipo de caractere selecionado!" if pool.empty?

    Array.new(@length) { pool.sample }.join
  end
end

puts "Gerador de Senhas Seguras"

print "Comprimento da senha: "
length = gets.chomp.to_i

print "Incluir letras minúsculas? (s/n): "
use_lowercase = gets.chomp.downcase == 's'

print "Incluir letras maiúsculas? (s/n): "
use_uppercase = gets.chomp.downcase == 's'

print "Incluir números? (s/n): "
use_numbers = gets.chomp.downcase == 's'

print "Incluir símbolos? (s/n): "
use_symbols = gets.chomp.downcase == 's'

generator = PasswordGenerator.new(
  length: length,
  use_lowercase: use_lowercase,
  use_uppercase: use_uppercase,
  use_numbers: use_numbers,
  use_symbols: use_symbols
)

puts "Senha gerada: #{generator.generate}"
