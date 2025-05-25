class Calculator
  def add(input)
     if input.strip.empty?
       result =  0
     else
       delimiter_regex = /,|\n/
       if input.start_with?("//")
         delimiter_header, input = input.split("\n", 2)
         custom_delimiters = delimiter_header[2..-1]

         # Extract multiple or long delimiters
         delimiters = custom_delimiters.scan(/\[(.*?)\]/).flatten
         if delimiters.empty?
           delimiters = [custom_delimiters]
         end
         delimiter_regex = Regexp.union(delimiters.map { |d| Regexp.escape(d) })
       end

       numbers = input.split(delimiter_regex).map(&:to_i)
       result = numbers.sum
     end
     result
  end
end
