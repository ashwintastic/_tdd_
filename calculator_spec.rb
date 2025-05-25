require_relative './calculator'

RSpec.describe Calculator do
  let(:calc) { Calculator.new }

  it "returns 0 for an empty string" do
    expect(calc.add("")).to eq(0)
  end

  it "returns number for a single number" do
    expect(calc.add("1")).to eq(1)
  end

  it "returns sum for two numbers" do
    expect(calc.add("1,2")).to eq(3)
  end

  it "handles unknown amount of numbers" do
    expect(calc.add("1,2,3,4")).to eq(10)
  end

  it "supports newline as a delimiter" do
    expect(calc.add("1\n2,3")).to eq(6)
  end

  it "supports custom delimiter" do
    expect(calc.add("//;\n1;2")).to eq(3)
  end

  it "throws on negative numbers" do
    expect { calc.add("1,-2,-3") }.to raise_error("negatives not allowed: -2, -3")
  end

  it "ignores numbers > 1000" do
    expect(calc.add("2,1001")).to eq(2)
  end

  it "supports long custom delimiter" do
    expect(calc.add("//[***]\n1***2***3")).to eq(6)
  end

  it "supports multiple delimiters" do
    expect(calc.add("//[*][%]\n1*2%3")).to eq(6)
  end

  it "supports multiple long delimiters" do
    expect(calc.add("//[***][%%]\n1***2%%3")).to eq(6)
  end
end
