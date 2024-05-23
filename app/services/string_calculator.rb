class StringCalculator
    DELIMITERS = [",", "\n"]
    def add(string_number)
        return 0 if string_number.empty?
        parse_and_sum(string_number)
    end

    private
    
    def parse_and_sum(string_number)
        string_number.split(Regexp.union(DELIMITERS)).map(&:to_i).sum
    end
end