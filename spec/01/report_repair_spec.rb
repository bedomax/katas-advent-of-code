require_relative '../../lib/01/report_repair'

describe ReportRepair do
  let(:report_repair) { ReportRepair.new }
  it 'result is bedo' do
    expect(report_repair.call).to eq("bedo")
  end
end