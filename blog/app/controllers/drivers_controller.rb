class DriversController < ApplicationController
  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find(params[:id])
  end

  def new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      ActionCable.server.broadcast(
        "drivers",
        { driver: @driver, host: request.base_url}
      )
      redirect_to @driver
    else
      render 'new'
    end
  end

  private def driver_params
    params.require(:driver).permit(:name, :image, :email)
  end
end
