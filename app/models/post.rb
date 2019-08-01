class Post < ApplicationRecord
  belongs_to :user
  has_many :comments,  dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  # validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
