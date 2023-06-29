class Food < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients
  belongs_to :user, foreign_key: 'user_id', optional: true

  validates :name, presence: true 
  validates :measuring_unit, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
end
