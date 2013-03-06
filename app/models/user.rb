class User < ActiveRecord::Base
  attr_accessible :email

  VALID_EMAIL = /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: VALID_EMAIL }
end
