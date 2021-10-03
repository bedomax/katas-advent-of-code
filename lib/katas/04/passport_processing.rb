require_relative '../../../helpers/file_helper'

class PassportProcessing
  PATH_FILE = "./assets/04/input.txt"
  PASSPORT_PATTERN = %w[byr iyr eyr hgt hcl ecl pid]
  attr_reader :passports
  attr_reader :rules
  def initialize(input_file:PATH_FILE)
    @passports = FileHelper.read_file_with_separator(path:input_file, separator:"\n\n")
  end
  def get_total_valid(rules: false)
    @rules = rules
    passports.map(&method(:parse_passport)).filter(&method(:validate_credentials)).size
  end

  private

  def validate_credentials(passport_hash)
    if rules
      return false unless passport_pattern_validation(passport_hash)
      return false unless birth_year_validation(passport_hash["byr"])
      return false unless issue_year_validation(passport_hash["iyr"])
      return false unless expiration_year_validation(passport_hash["eyr"])
      return false unless height_validation(passport_hash["hgt"])
      return false unless hair_validation(passport_hash["hcl"])
      return false unless eye_color_validation(passport_hash["ecl"])
      return false unless passport_id_validation(passport_hash["pid"])
      true
    else
      (PASSPORT_PATTERN - passport_hash.keys).size.zero?
    end
  end

  def parse_passport(passport_info)
    parts = passport_info.split(' ')
    parts.map{|part| part.split(':')}.to_h
  end

  def passport_pattern_validation(passport_hash)
    (PASSPORT_PATTERN - passport_hash.keys).size === 0
  end

  def birth_year_validation(byr)
    (byr.to_i >=1920 && byr.to_i <= 2002)
  end

  def issue_year_validation(iyr)
    (iyr.to_i >= 2010 && iyr.to_i <= 2020)
  end

  def expiration_year_validation(eyr)
    (eyr.to_i >= 2020 && eyr.to_i <= 2030)
  end

  def height_validation(hgt)
    height_match = hgt.match /\A(\d+)(cm|in)\z/
    return false if height_match.nil?
    value, metric = height_match.captures
    if metric == "cm"
      return false if value.to_i < 150 || value.to_i > 193
    elsif metric == "in"
      return false if value.to_i < 59 || value.to_i > 76
    end
    true
  end

  def hair_validation(hcl)
    hair_color_match = hcl.match /\A#[0-9a-f]{6}\z/
    return false if hair_color_match.nil?
    true
  end

  def eye_color_validation(ecl)
    eye_colors = %w[amb blu brn gry grn hzl oth]
    return false unless eye_colors.include?(ecl)
    true
  end

  def passport_id_validation(pid)
    pid_match = pid.match /\A\d{9}\z/
    return false if pid_match.nil?
    true
  end
end