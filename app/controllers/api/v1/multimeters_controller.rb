class Api::V1::MultimetersController < ApplicationController

  before_action :set_multimeter, only: %i[show]# show update destroy

  def index
    @multimeters = Multimeter.all 
    render json: @multimeters
  end

  def show
    render json: @multimeter
  end

private

def set_multimeter
  @multimeter = Multimeter.find(params[:id])
end

def multimeter_params
  params.require(:multimeter).permit(:mult_type, :description)
end

end