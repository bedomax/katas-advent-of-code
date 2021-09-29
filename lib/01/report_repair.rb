require_relative '../../helpers/file_helper'

class ReportRepair
  PATH_FILE = "./assets/01/input.txt"
  attr_reader :expenses
  def initialize
    @expenses = FileHelper.read_file_to_array(path:PATH_FILE, integer: true)
  end
  def part_1
    pairs = @expenses.combination(2).find_all do |a, b|
      a + b == 2020
    end
    pairs.flatten.inject(:*)
  end
end