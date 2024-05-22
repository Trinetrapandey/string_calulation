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
  end
end