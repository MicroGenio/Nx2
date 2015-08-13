class Marketer < ActiveRecord::Base
  has_many :ideas
  has_many :likes
  has_many :reviews
  before_save { self.email = email.downcase }
  validates :marketername, presence: true, length: { minimum: 3, maximum: 40 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
                                    uniqueness: { case_sensitive: false },
                                    format: { with: VALID_EMAIL_REGEX }
has_secure_password
end
