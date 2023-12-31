class Api::V1::MultimetersController < ApplicationController

  before_action :set_multimeter, only: %i[show update destroy]# show update destroy

  def index
    @multimeters = Multimeter.all 
    render json: @multimeters
  end

  def show
    render json: @multimeter
  end

  def create
    @multimeter = Multimeter.new(multimeter_params)
    if @multimeter.save
      render json: @multimeter, status: :created, location: api_v1_multimeter_url(@multimeter)
    else
      render json: @multimeter.errors, status: :unprocessable_entity
    end
  end

  def update
    if @multimeter.update(multimeter_params)
      render json: @multimeter
    else
      render json: @multimeter.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @multimeter.destroy!
  end

private

def set_multimeter
  @multimeter = Multimeter.find(params[:id])
end

def multimeter_params
  params.require(:multimeter).permit(:mult_type, :description)
end

end