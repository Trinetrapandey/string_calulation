class StringCalculator
    def add(string_number)
        return 0 if string_number.empty?
        string_number.split(",").map(&:to_i).sum
    end 
end