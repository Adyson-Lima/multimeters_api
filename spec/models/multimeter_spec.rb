require 'rails_helper'

RSpec.describe Multimeter, type: :model do

  before{@multimeter = Multimeter.new}

  describe "Teste de preenchimento do model Multimeter" do

    it "mult_type consegue ser preenchido?" do
      @multimeter.mult_type = "analogico"
      expect(@multimeter.mult_type).to eq("analogico")
    end

    it "description consegue ser preenchido?" do
      @multimeter.description = "multimetro antigo"
      expect(@multimeter.description).to eq("multimetro antigo")
    end

  end

  describe "Teste de validação do model Multimeter" do
    
    it "Multimeter valido com campos obrigatorios preenchidos?" do
      @multimeter.mult_type = "digital"
      @multimeter.description = "multimetro mais utilizado"
      expect(@multimeter).to be_valid
    end

    it "Multimeter invalido com campos obrigatorios não preenchidos?" do
      multimeter = Multimeter.new
      expect(multimeter).to be_valid
    end
    
  end

end