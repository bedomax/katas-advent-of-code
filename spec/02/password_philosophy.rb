require_relative '../../lib/02/password_philosophy'

describe PasswordPhilosophy do
  let(:password_philosophy) { PasswordPhilosophy.new }
  it 'solve part 1' do
    expect(password_philosophy.part_1).to eq(655)
  end
end