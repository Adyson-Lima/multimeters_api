require "rails_helper"

RSpec.describe Api::V1::MultimetersController, type: :controller do

  before{@multimeter = Multimeter.create(mult_type: "bancada", description: "multimetro caro")}

  describe "GET /api/v1/multimeters" do
    it "Consegue listar todos os multimeters e retornar status 200?" do
      get :index
      expect(JSON.parse(response.body).size).to eq(1)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/multimeters/id" do
    it "Consegue listar um multimeter especifico e retornar status 200?" do
      get :show, params: {id: @multimeter.id}
      expect(response.body).to include_json(id: @multimeter.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/multimeters" do
    it "Consegue criar um multimeter e retornar status 201?" do
      post :create, params: {multimeter: {mult_type: "analogico", description: "multimetro antigo"}, format: :json}
      expect(response.body).to include_json(mult_type: "analogico")
      expect(response).to have_http_status(201)
    end
  end  

  describe "PATCH /api/v1/multimeters/id" do
    it "Consegue atualizar um multimeter e retornar status 200?" do
      multimeter = Multimeter.last
      patch :update, params: {multimeter: {mult_type: "digital", description: "multimetro comum"}, id: multimeter.id}
      expect(response.body).to include_json(mult_type: "digital")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /api/v1/multimeters/id" do
    it "Consegue excluir um multimeter e retornar status 204?" do
      multimeter = Multimeter.last
      delete :destroy, params: {id: multimeter.id}
      expect(Multimeter.all).not_to include(multimeter)
      expect(response).to have_http_status(204)
    end
  end

end