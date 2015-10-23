class User < ActiveRecord::Base
  has_secure_password
  has_many :events
  has_many :attends
  has_many :comments
  has_many :events, through: :comments
  has_many :events, through: :attends
  EMAIL_REGEX = /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  validates :first_name, :last_name, :email, :city, :state, presence: true
  validates :email, format: {with: EMAIL_REGEX}, uniqueness: true, on: :create
  validates :password_digest, length: { minimum: 8 }, presence: true, on: :create
end
