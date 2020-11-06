# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    cars = Car.create([
      { title: 'my_white_volvo', color: 1 },
      { title: 'my_blue_porche', color: 0},
      { title: 'red_jaguar', color: 2},
      { title: 'green_ lamborghini', color: 2 }
    ])

    drivers = Driver.create([
      { name: 'Omer', email: 'omer@cnvrg.io'  },
      { name: 'Yarden', email: 'yarden@cnvrg.io' }
    ])

    DriversCar.create([
      { driver_id: drivers[0].id, car_id: cars[0].id  },
      { driver_id: drivers[0].id, car_id: cars[1].id  },
      { driver_id: drivers[0].id, car_id: cars[2].id  },
      { driver_id: drivers[1].id, car_id: cars[1].id  },
      { driver_id: drivers[1].id, car_id: cars[2].id  },
      { driver_id: drivers[1].id, car_id: cars[3].id  }
    ])
