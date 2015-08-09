class Review < ActiveRecord::Base
  belongs_to :marketer
  belongs_to :idea_styles
  validates :marketer_id, presence: true
  validates :body, presence: true, length: { minimum: 10, maximum: 500 }

end