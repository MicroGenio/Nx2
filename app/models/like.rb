class Like < ActiveRecord::Base
  belongs_to :marketer
  belongs_to :idea
  
 validates_uniqueness_of :marketer, scope: :idea
end