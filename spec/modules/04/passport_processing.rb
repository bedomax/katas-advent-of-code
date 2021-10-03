require_relative '../../../lib/katas/04/passport_processing'

describe PassportProcessing do
  let(:part_1) {
    PassportProcessing.new(input_file: "./spec/support/assets/04/input_01.txt")
  }
  let(:part_2) {
    PassportProcessing.new(input_file: "./spec/support/assets/04/input_02.txt")
  }
  describe 'Validate passports according to specifications' do
    it 'find total number of valid passports - solve part 1' do
      expect(part_1.get_total_valid).to eq(2)
    end
    it 'find total number of valid passports with rules  - solve part 2' do
      expect(part_2.get_total_valid(rules: true)).to eq(4)
    end
  end
end