require 'rails_helper'

RSpec.describe StringCalculator, type: :service do
  describe "add" do
    it "should return zero" do
      expect(StringCalculator.new.add('')).to eq(0)
    end
    
    it "should return number if single number is present" do
      expect(StringCalculator.new.add('1')).to eq(1)
    end

    it "should return sum if two number are given" do
      expect(StringCalculator.new.add('1,5')).to eq(6)
    end

    it "should return sum if multiple  number are given" do
      expect(StringCalculator.new.add('1,5,6,7,8,9,6,4,2')).to eq(48)
    end

    it 'handles newline charcter between string' do
      expect(StringCalculator.new.add("1\n2,3")).to eq(6)
    end
    
    it 'allows custom delimiters defined at the beginning (single char)' do
      expect(StringCalculator.new.add("//;\n1;2")).to eq(3)
    end

    it 'allows custom delimiters defined at the beginning (multiple chars)' do
      expect(StringCalculator.new.add("//abc\n1abc2abc3")).to eq(6)
    end

    it 'allows custom delimiters of any length defined at the beginning' do
      expect(StringCalculator.new.add("//***\n1***2***3")).to eq(6)
    end

    it 'raise exception for negative number' do
      expect { StringCalculator.new.add("1,-2,-3") }.to raise_error("negative numbers not allowed: -2, -3")
    end
  end
end