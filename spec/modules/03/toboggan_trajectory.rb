require_relative '../../../lib/katas/03/toboggan_trajectory'

describe TobogganTrajectory do
  let(:toboggan_trajectory) {
    TobogganTrajectory.new(input_file: "./spec/support/assets/03/input.txt")
  }
  describe 'how many elements would you encounter' do
    it 'find trees - solve part 1' do
      expect(toboggan_trajectory.get_number_trees).to eq(7)
    end
    it 'find trees with rules  - solve part 2' do
      expect(toboggan_trajectory.get_number_trees_with_slopes).to eq(336)
    end
  end
end