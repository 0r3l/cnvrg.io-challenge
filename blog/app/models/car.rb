class Car < ApplicationRecord
  self.inheritance_column = 'not_type'
  enum color: { blue: 0, yellow: 1, red: 2 }
  validates :title, presence: true
  has_many :drivers_cars
  has_many :drivers, through: :drivers_cars, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => ["image/png"]

end
