require_relative '../../lib/01/report_repair'

describe ReportRepair do
  let(:report_repair) { ReportRepair.new }
  it 'solve part 1 - Find sum of 2020 and multiply values' do
    expect(report_repair.part_1).to eq(1006875)
  end
end