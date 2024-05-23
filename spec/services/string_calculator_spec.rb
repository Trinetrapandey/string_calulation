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
  end
end