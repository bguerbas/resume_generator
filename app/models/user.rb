class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :login, :password, :email, presence: true

  validates :login, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
  validates :password, length: { in: 6..10 }
  validates :email, uniqueness: { case_sensitive: false }
  VALID_EMAIL_FORMAT = URI::MailTo::EMAIL_REGEXP
  validates :email, format: { with: VALID_EMAIL_FORMAT }, uniqueness: true
  before_save { self.email = email.downcase }
end
