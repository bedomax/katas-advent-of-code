require_relative '../../../helpers/file_helper'

class PasswordPhilosophy
  PATH_FILE = "./assets/02/input.txt"
  attr_reader :passwords

  def initialize(input_file:PATH_FILE)
    @passwords = FileHelper.read_file_to_array(path:input_file)
  end

  def validate_structure
    passwords.filter(&method(:validate_structure_rule)).size
  end

  def validate_position
    passwords.filter(&method(:validate_position_rule)).size
  end

  private

  def validate_structure_rule(row)
    password, rule = parse_row(row)
    password_size = password.chars.filter { |char| char == rule[:letter]}.size
    min, max = rule[:num_1], rule[:num_2]
    min <= password_size && password_size <= max
  end

  def validate_position_rule(row)
    password, rule = parse_row(row)
    position_1 , position_2 = rule[:num_1] - 1 , rule[:num_2] - 1
    (password[position_1] == rule[:letter]) ^ (password[position_2] == rule[:letter])
  end

  def parse_row(row)
    unparsed, password = row.split(': ')
    min_max, letter = unparsed.split(' ')
    min,max = min_max.split('-').map(&:to_i)
    [password.strip, {letter: letter, num_1: min, num_2: max}]
  end
end