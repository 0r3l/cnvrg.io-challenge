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
    @car.save
    redirect_to @car
  end

  private def car_params
    params.require(:car).permit(:title, :image, :type, :color)
  end
end
