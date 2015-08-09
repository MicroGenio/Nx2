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
    mount_uploader :picture, PictureUploader
    validate :picture_size
    
    private
      def picture_size
          if picture.size > 5.megabytes
              errors.add(:picture, "should be less than 5MB")
          end
      end
end