require 'spec_helper'

describe Lamp do

  let(:lamp) do
    @lamp ||= Lamp.new
  end

  let(:complete_lamp) do
    @lamp ||= Lamp.new(
      :name       => "desk lamp",
      :house_code => 'A',
      :unit_code  => 2
    )
  end

  it { complete_lamp.should be_valid }

  context 'name' do
    it { should have(1).error_on :name }

    it "should be valid with name" do
      lamp.name = "my lamp"
      lamp.should have(0).error_on :name
    end
  end

  context 'house code' do
    it { should have(2).error_on :house_code }

    it "shouldn't be valid with a bad house code" do
      lamp.house_code = 'Z'
      lamp.should have(1).error_on :house_code
    end

    Domotic::Data::House_code.each do |house_code|
      it "should be valid with a valid house code" do
        lamp.house_code = house_code
        lamp.should have(0).error_on :house_code
      end
    end
  end

  context 'unit code' do
    it { should have(2).error_on :unit_code }

    [-5, 0, 17].each do |unit_code|
      it "shouldn't be valid with a bad unit code: #{unit_code}" do
        lamp.unit_code = unit_code
        lamp.should have(1).error_on :unit_code
      end
    end

    16.times.each do |unit_code|
      unit_code = unit_code.succ

      it "should be valid with a valid unit code: #{unit_code}" do
        lamp.unit_code = unit_code
        lamp.should have(0).error_on :unit_code
      end
    end
  end
end