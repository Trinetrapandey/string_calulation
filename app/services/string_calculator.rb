class StringCalculator
  DELIMITERS = [",", "\n"]
  
  def add(string_number)
    return 0 if string_number.empty?
    delimiters, numbers = extract_delimiters_and_numbers(string_number)
    numbers_array = split_numbers(numbers, delimiters)
    negatives = numbers_array.select { |num| num < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
    numbers_array.sum
  end

  private

  def extract_delimiters_and_numbers(string_number)
    if string_number.start_with?("//")
      delimiter_part, numbers = string_number[2..].split("\n", 2)
      delimiters = delimiter_part.scan(/\[([^\]]+)\]|([^\[])/).flatten.compact
    else
      delimiters = DELIMITERS
      numbers = string_number
    end
    [delimiters, numbers]
  end

  def split_numbers(numbers, delimiters)
      numbers.split(Regexp.union(delimiters)).map(&:to_i)
  end
end