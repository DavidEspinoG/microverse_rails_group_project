class Food < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :recipes, through: :ingredients
  belongs_to :user, foreign_key: 'user_id', optional: true
end
