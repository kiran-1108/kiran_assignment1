class Property < ApplicationRecord
  belongs_to :user
  validates :name, :location,:price, presence: true
  has_one_attached :image

end
