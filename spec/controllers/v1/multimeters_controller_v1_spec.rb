require "rails_helper"

RSpec.describe Api::V1::MultimetersController, type: :controller do

  before{@multimeter.create(mult_type: "bancada", description: "multimetro caro")}

  describe "GET /api/v1/multimeters" do
    it "Consegue listar todos os multimeters e retornar status 200?" do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

end