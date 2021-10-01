require_relative '../../../lib/katas/02/password_philosophy'

describe PasswordPhilosophy do
  let(:password_philosophy) {
    PasswordPhilosophy.new(input_file: "./spec/support/assets/02/input.txt")
  }
  describe 'Count how many passwords have' do
    it 'structure rule - solve part 1' do
      expect(password_philosophy.validate_structure).to eq(2)
    end
    it 'position rule  - solve part 2' do
      expect(password_philosophy.validate_position).to eq(1)
    end
  end
end