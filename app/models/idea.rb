class Idea < ActiveRecord::Base
    belongs_to :marketer
    has_many :likes, dependent: :destroy
    has_many :reviews, dependent: :destroy
    has_many :idea_styles, dependent: :destroy
    has_many :styles, through: :recipe_styles
    has_many :idea_ingredients, dependent: :destroy
    has_many :ingredients, through: :idea_ingredients
    validates :marketer_id, presence: true  
    validates :name, presence: true, length: { minimum: 5, maximum: 100}
    validates :summary, presence: true, length: { minimum: 10, maximum: 150}
    validates :description, presence: true, length: { minimum: 20, maximum: 500 }
    
    default_scope -> { order(updated_at: :desc) }
  
  def thumbs_up_total
    self.likes.where(like: true).size
  end
  
  def thumbs_down_total
    self.likes.where(like: false).size    
  end
  
  
    
    
end

