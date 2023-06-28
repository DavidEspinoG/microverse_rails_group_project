class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  belongs_to :user
end
