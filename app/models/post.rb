# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', inverse_of: :posts
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy

  validates :title, presence: true
  validates :body, length: { minimum: 100, maximum: 1000 }
end
