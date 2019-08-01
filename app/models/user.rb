class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :username, presence: true,
  uniqueness: { case_sensitive: false },
  length: { minimum: 3, maximum: 25 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: true
  validates :email, presence: true, length: { maximum: 105 },
  uniqueness: { case_sensitive: false },
  format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  has_many :comments, dependent: :destroy
end