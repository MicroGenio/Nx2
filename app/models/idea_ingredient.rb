class IdeaIngredient < ActiveRecord::Base
  belongs_to :idea
  belongs_to :ingredient
end