class Style < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  has_many :idea_styles
  has_many :ideas, through: :idea_styles
end