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
    default_delimiters = [",", "\n"]

    if input.start_with?("//")
      delimiter_line, input = input.split("\n", 2)
      raw_delimiters = delimiter_line[2..]

      # Detect [multi] delimiters or fallback to single
      if raw_delimiters.start_with?("[")
        # Handles //[***] or //[*][%]
        delimiters = raw_delimiters.scan(/\[(.*?)\]/).flatten
      else
        delimiters = [raw_delimiters]
      end

      return [input, delimiters]
    end

    [input, default_delimiters]
  end

  def split_numbers(input, delimiters)
    regex = Regexp.union(delimiters.map { |d| Regexp.escape(d) })
    input.split(regex).map(&:to_i)
  end
end
