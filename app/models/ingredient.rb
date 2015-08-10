class Ingredient < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :idea_ingredients
  has_many :ideas, through: :idea_ingredients
end