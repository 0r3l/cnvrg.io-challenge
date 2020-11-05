class CreateDriversCars < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers_cars do |t|
      t.belongs_to :car
      t.belongs_to :driver

      t.timestamps
    end
  end
end
