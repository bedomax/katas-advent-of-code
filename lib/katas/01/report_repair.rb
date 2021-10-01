require_relative '../../../helpers/file_helper'

class ReportRepair
  PATH_FILE = "./assets/01/input.txt"
  attr_reader :expenses
  def initialize(input_file:PATH_FILE)
    @expenses = FileHelper.read_file_to_array(path:input_file, integer: true)
  end
  def calc_entries(combination:2, sum:2020)
    result = 0
    sorter = expenses.combination(combination)
    result = sorter.find_all { |a, b| a + b  == sum }.flatten.inject(:*) if combination == 2
    result = sorter.find_all { |a, b, c| a + b + c == sum }.flatten.inject(:*) if combination == 3
    result
  end
end