require_relative 'import'

class App
  attr_reader :challenge_1, :challenge_2, :challenge_3, :challenge_4
  def initialize(options={})
    @challenge_1 = ReportRepair.new
    @challenge_2 = PasswordPhilosophy.new
    @challenge_3 = TobogganTrajectory.new
  end
  def call
    puts "**********************************"
    puts "**********************************"
    puts "*********Advent of Code***********"
    puts "*************2020*****************"
    puts "\n"
    puts "--- Day 1: Report Repair ---"
    puts "Part One: "+@challenge_1.calc_entries(combination:2 , sum: 2020).to_s+".... ✅"
    puts "Part Two: "+@challenge_1.calc_entries(combination:3 , sum: 2020).to_s+".... ✅"
    puts "\n"
    puts "--- Day 2: Password Philosophy ---"
    puts "Part One: "+@challenge_2.validate_structure.to_s+".... ✅"
    puts "Part Two: "+@challenge_2.validate_position.to_s+".... ✅"
    puts "\n"
    puts "--- Day 3: Toboggan Trajectory ---"
    puts "Part One: "+@challenge_3.get_number_trees.to_s+".... ✅"
    puts "Part Two: "++@challenge_3.get_number_trees_with_slopes.to_s+".... ✅"
    puts "\n"
    puts "--- Day 4: Passport Processing ---"
    puts "Part One: "+0.to_s+".... ✅"
    puts "Part Two: "+0.to_s+".... ✅"
    puts "\n"
    puts "\n"
    puts "\n"
  end
end

