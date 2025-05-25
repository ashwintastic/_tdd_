require_relative './calculator'

RSpec.describe Calculator do
  let(:calc) { Calculator.new }

  it "returns 0 for an empty string" do
    expect(calc.add("")).to eq(0)
  end

  it "returns the sum of an unknown amount of numbers" do
    input = (1..100).to_a.join(",")
    expected_sum = (1..100).sum
    expect(calc.add(input)).to eq(expected_sum)
  end

end
