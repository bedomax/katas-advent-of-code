require_relative '../../../helpers/file_helper'

class TobogganTrajectory
  PATH_FILE = "./assets/03/input.txt"
  attr_reader :terrain
  SLOPES = [
      { x: 1, y: 1 },
      { x: 3, y: 1 },
      { x: 5, y: 1 },
      { x: 7, y: 1 },
      { x: 1, y: 2 },
  ]
  def initialize(input_file:PATH_FILE)
    data = FileHelper.read_file_to_array(path:input_file)
    @terrain = data.map{|row| row.split('')}
  end
  def get_number_trees
    parse_trees(terrain, 3)
  end

  def get_number_trees_with_slopes
    trees_match_slope = SLOPES.map do |slope|
      rows_to_check = terrain.each.with_index.filter do |row, index|
        (index % slope[:y]).zero?
      end.map {|row, _index| row}
      parse_trees(rows_to_check, slope[:x])
    end
    trees_match_slope.reduce(&:*)
  end

  private

  def parse_trees(rows, slope)
    x_pos = 0
    filtered_rows =
        rows.filter do |row|
          search_tree = row[x_pos % row.size] === '#'
          x_pos += slope
          search_tree
        end
    filtered_rows.size
  end

end