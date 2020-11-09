class DriversandcarsController < ApplicationController

  def index
    all_drivers_and_cars
    cars_by_driver
    drivers_by_car
  end

  def match
    all_drivers_and_cars
  end

  def create_match
    @driversandcars = driverandcars_params
    DriversCar.find_or_create_by({car_id: @driversandcars['car'], driver_id: @driversandcars['driver']})
    redirect_to driversandcars_path(@driversandcars)
  end

  def create
    @driversandcars = driverandcars_params
    redirect_to @driversandcars

  end

  private def all_drivers_and_cars
    @cars = Car.all.map { |c| [c.title, c.id] }
    @drivers = Driver.all.map { |d| [d.name, d.id] }
  end

  private def driverandcars_params
    params.require(:driversandcars).permit(:driver, :car)
  end

  private def cars_by_driver
    if params['driver']
      driver = Driver.find(params['driver'])
      drivers_cars = driver.drivers_cars
      @cars_by_driver = driver.cars.map { |c|
      {
        id: c.id,
        title: c.title,
        drivers_cars_created_at: drivers_cars.where(car_id: c.id).first.created_at
      }
     }
    end
  end

  private def drivers_by_car
    if params['car']
      car = Car.find(params['car'])
      drivers_cars = car.drivers_cars
      @drivers_by_car = car.drivers.map { |d|
      {
        id: d.id,
        name: d.name,
        drivers_cars_created_at: drivers_cars.where(driver_id: d.id).first.created_at
      }
     }
    end
  end

end
