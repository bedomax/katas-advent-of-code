require_relative '../../helpers/file_helper'

class PasswordPhilosophy
  PATH_FILE = "./assets/02/input.txt"
  attr_reader :passwords

  def initialize
    @passwords = FileHelper.read_file_to_array(path:PATH_FILE)
  end

  def part_1
    @passwords.filter(&method(:validate_password)).size
  end

  private

  def validate_password(row)
    password, rule = parse_row(row)
    password_size = password.chars.filter { |char| char == rule[:letter]}.size
    rule[:min] <= password_size && password_size <= rule[:max]
  end

  def parse_row(row)
    unparsed, password = row.split(': ')
    min_max, letter = unparsed.split(' ')
    min, max = min_max.split('-').map(&:to_i)
    [password, {letter: letter, min: min, max: max}]
  end
end