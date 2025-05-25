class Calculator
  def add(input)
     if input.strip.empty?
       result =  0
     else
       input = input.split(',').map(&:to_i)
       result = input.sum
     end
     result
  end
end
