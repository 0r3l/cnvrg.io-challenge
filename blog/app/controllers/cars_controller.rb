class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      ActionCable.server.broadcast(
        "cars",
        { car: @car, host: request.base_url}
      )
      redirect_to @car
    else
      render 'new'
    end
  end

  private def car_params
    params.require(:car).permit(:title, :image, :type, :color)
  end
end
