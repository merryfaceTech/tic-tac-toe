require_relative "../tictactoe"

describe Tictactoe do
  before(:each) do
    @tictactoe = described_class.new
  end

  it "does something" do
    result = @tictactoe.turn
    expect(result).to eq("bye there")
  end
end
