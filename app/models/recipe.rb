class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :foods, through: :ingredients
  belongs_to :user

  #validates :name, presence: true
  #validates :preparation_time, presence: true
  #validates :cooking_time, presence: true
  #validates :description, presence: true
end
