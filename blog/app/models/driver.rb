class Driver < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  has_many :drivers_cars
  has_many :cars, through: :drivers_cars, dependent: :destroy
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
