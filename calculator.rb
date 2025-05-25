class Calculator
  def add(input)
    return 0 if input.strip.empty?

    delimiters = [",", "\n"]


    if input.start_with?("//")
      p "==="
      delimiter_section, input = input.split("\n", 2)
      delimiter_section = delimiter_section[2..]

      if delimiter_section.start_with?("[")
        # Handles multiple delimiters, possibly long ones
        delimiters = delimiter_section.scan(/\[(.+?)\]/).flatten
      else
        # Single character delimiter
        delimiters = [delimiter_section]
      end
      split_regex = Regexp.union(delimiters.map { |d| Regexp.escape(d) })
    else
      split_regex = /,|\n/
    end

    # Split numbers and parse them
    numbers = input.split(split_regex).map(&:to_i)

    # Handle negatives
    negatives = numbers.select { |n| n < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Ignore numbers > 1000
    numbers.reject { |n| n > 1000 }.sum
  end
end
