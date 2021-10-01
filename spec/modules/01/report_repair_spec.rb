require_relative '../../../lib/katas/01/report_repair'

describe ReportRepair do
  let(:report_repair) {
    ReportRepair.new(input_file: "./spec/support/assets/01/input.txt")
  }
  it 'solve part 1 - Find sum of 2020 and multiply 2 values' do
    expect(report_repair.calc_entries(combination:2 , sum: 2020)).to eq(514579)
  end
  it 'solve part 2 - Find sum of 2020 and multiply 3 values' do
    expect(report_repair.calc_entries(combination:3 , sum: 2020)).to eq(241861950)
  end
end