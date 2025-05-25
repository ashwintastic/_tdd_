class Calculator
  def add(input)
    return 0 if input.strip.empty?

    # Extract all numbers (including negatives)
    numbers = input.scan(/-?\d+/).map(&:to_i)

    # Raise if negatives are present
    negatives = numbers.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Ignore numbers > 1000
    numbers.reject { |n| n > 1000 }.sum
  end
end
