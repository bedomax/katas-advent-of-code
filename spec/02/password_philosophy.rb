require_relative '../../lib/02/password_philosophy'

describe PasswordPhilosophy do
  let(:password_philosophy) { PasswordPhilosophy.new }
  describe 'Count how many passwords have' do
    it 'structure rule - solve part 1' do
      expect(password_philosophy.validate_structure).to eq(655)
    end
    it 'position rule  - solve part 2' do
      expect(password_philosophy.validate_position).to eq(673)
    end
  end
end