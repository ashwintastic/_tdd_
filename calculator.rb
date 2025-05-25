class Calculator
  def add(input)
    return 0 if input.strip.empty?

    input, delimiters = extract_delimiters(input)
    numbers = split_numbers(input, delimiters)

    negatives = numbers.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.reject { |n| n > 1000 }.sum
  end

  private

  def extract_delimiters(input)
    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      raw_delimiters = delimiter_line[2..-1]

      if raw_delimiters.start_with?("[")
        # Multiple or long delimiters: //[***][%%]
        delimiters = raw_delimiters.scan(/\[(.+?)\]/).flatten
      else
        # Single-char delimiter: //;\n
        delimiters = [raw_delimiters]
      end

      [input, delimiters]
    else
      [input, [",", "\n"]]
    end
  end

  def split_numbers(input, delimiters)
    pattern = Regexp.union(delimiters.map { |d| Regexp.escape(d) })
    input.split(pattern).map(&:to_i)
  end
end
