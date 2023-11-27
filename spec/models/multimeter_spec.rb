require 'rails_helper'

RSpec.describe Multimeter, type: :model do

  before{@multimeter = Multimeter.new}

  describe "Teste de preenchimento do model Multimeter" do

    it "mult_type consegue ser preenchido?" do
      @multimeter.mult_type = ""
      expect(@multimeter.mult_type).to eq("analogico")
    end

  end

end